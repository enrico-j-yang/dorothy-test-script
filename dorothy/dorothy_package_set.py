# -- coding: utf-8 --
from time import sleep

from can_sim.engine_p import *
from can_sim.fuel_p import *
from can_sim.hud_set_p import *
from can_sim.ldw_p import *
from can_sim.navigation_p import *
from can_sim.package_set import *
from can_sim.speed_p import *
from can_sim.tire_p import *
from common.test_timer import *


class DorothyPackageSet(PackageSet):
    interrupt = False
    cb = None
    duration = 0
    stop_flag = None
    start_time = 0
    digital_values = {}

    """docstring for PackageSet"""

    def __init__(self, can_serial):
        super(PackageSet, self).__init__()
        self.can_serial = can_serial
        self.sem = threading.Semaphore(1)
        self.lock = threading.Lock()
        self.speed_p = SpeedP()
        self.engine_p = CoolantTemperatureP()
        self.tire_p = TireP()
        self.hud_set_p = HudSetP()
        self.fuel_p = FuelP()
        self.ldw_p = LdwP()
        self.limit_p = LimitSpeedP()
        self.indicator_p = IndicatorP()
        self.navigation_p = NavigationP()
        self.digital_values = {
            "Speed": {"Package": "speed",
                      "Initial Value": 0,
                      "End Value": 0,
                      "Process": self.speed_p,
                      "Process Set Value Method": self.speed_p.set_speed,
                      "Package List Name": self.var_speed},
            "ECT": {"Package": "coolant_temp",
                    "Initial Value": 0,
                    "End Value": 0,
                    "Process": self.engine_p,
                    "Process Set Value Method": self.engine_p.set_temperature,
                    "Package List Name": self.var_coolant_temp},
            "RPM": {"Package": "limit_speed",
                    "Initial Value": 0,
                    "End Value": 0,
                    "Process": self.limit_p,
                    "Process Set Value Method": self.limit_p.set_rpm,
                    "Package List Name": self.var_limit_speed},
            "LimitCruiseSpeed": {"Package": "limit_speed",
                                 "Initial Value": 0,
                                 "End Value": 0,
                                 "Process": self.limit_p,
                                 "Process Set Value Method": self.limit_p.set_limit_speed,
                                 "Package List Name": self.var_limit_speed},
            "SurplusFuel": {"Package": "fuel",
                            "Initial Value": 0,
                            "End Value": 0,
                            "Process": self.fuel_p,
                            "Process Set Value Method": self.fuel_p.set_fuel,
                            "Package List Name": self.var_fuel},
        }

    def set_duration(self, duration):
        self.duration = duration

    def start_send(self):
        self.interrupt = False
        time_li = []
        # 对周期进行分组,后续每一个周期分配一条线程
        for i in range(0, len(self.cycle_time)):
            tmp_time = self.cycle_time[i]
            id_li = []
            # 同样周期的数据根据id进行排序
            for key in self.package_list.keys():
                val = self.package_list.get(key)
                if val[2] == tmp_time:
                    target_i = 0
                    for id_i in range(0, len(id_li)):
                        # 比较两个id的大小
                        if val[0] > self.package_list.get(id_li[id_i])[0]:
                            target_i += 1
                    id_li.insert(target_i, key)

            time_li.append(id_li)

        self.stop_flag = threading.Event()
        # 把处理完的list放入线程
        for i in range(0, len(time_li)):
            # 开启一条线程
            t = MyLoopTimer(self.stop_flag, self.cycle_time[i], self.send_callback, (self.cycle_time[i], time_li[i]))
            self.threads.append(t)

        for t in self.threads:
            t.start()

        self.start_time = time.time()
        logging.debug("start_time" + str(self.start_time))
        sleep(self.duration)
        self.stop_send()

    def stop_send(self):
        self.interrupt = True
        # this will stop the timer
        self.stop_flag.set()
        for s in self.schedule.queue:
            self.schedule.cancel(s)
        for t in self.threads:
            t.join()
            del t
        self.threads.clear()

    def send_callback(self, inc, time_li):
        if self.interrupt is True:
            return

        eclipse_time = time.time() - self.start_time

        logging.debug("eclipse_time:" + str(eclipse_time))

        for val in time_li:
            for key, value in self.digital_values.items():
                if value["Package"] == val:
                    init_value = value["Initial Value"]
                    end_value = value["End Value"]

                    logging.debug("init " + key + ":" + str(init_value))
                    logging.debug("end " + key + ":" + str(end_value))
                    logging.debug("duration:" + str(self.duration))
                    if init_value != end_value:
                        current_value = float(init_value + (end_value -
                                                          init_value) * eclipse_time / self.duration)
                    else:
                        current_value = init_value

                    logging.debug("current " + key + ":" + str(current_value))
                    value["Process Set Value Method"](float(current_value))
                    self.set(value["Package List Name"],
                             value["Process"].get_data())

            msg_id = self.package_list.get(val)[0]
            msg_data = self.package_list.get(val)[1]
            logging.debug("inc" + str(inc) + "-" + val + "-msg_id" + str(msg_id) + "-msg_data" + str(msg_data))
            with self.lock:
                send_status = self.can_serial.send_data(msg_id, msg_data)
            logging.debug("after send data inc" + str(inc) + ":" + str(time.time()))

            if send_status == 1:
                logging.debug("发送成功")
            elif send_status == -1:
                logging.debug("请生成数据")
            else:
                logging.error("发送失败")

    def set_initial_value(self, key, value):

        """
        set initial value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_initial_value:" + str(value))
        self.digital_values.get(key)["Initial Value"] = float(value)

    def set_end_value(self, key, value):

        """
        set end value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_end_value:" + str(value))
        self.digital_values.get(key)["End Value"] = float(value)
