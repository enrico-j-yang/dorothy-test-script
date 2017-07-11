# -- coding: utf-8 --

import threading
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
    cb = None
    stop_flag = None
    duration = 0
    start_time = 0
    digital_values = {}
    var_navigation_clear = "navigation_clear"
    var_navigation_navi1 = "navigation_1"
    var_navigation_navi2 = "navigation_2"
    var_navigation_current_road = "navigation_current_road"
    var_navigation_navi3 = "navigation_3"

    navigation_thread = None

    navigation_cycle_time = 0.1

    navigation_flag = False

    navigation_package_list = {
        var_navigation_clear: [0x333, PackageSet.default_data, navigation_cycle_time],
        var_navigation_navi1: [0x333, PackageSet.default_data, navigation_cycle_time],
        var_navigation_navi2: [0x333, PackageSet.default_data, navigation_cycle_time],
        var_navigation_current_road: [0x333, PackageSet.default_data, navigation_cycle_time],
        var_navigation_navi3: [0x333, PackageSet.default_data, navigation_cycle_time]
    }

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
        self.stop_flag = threading.Event()
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

        self.navigation_values = {
            "DestDistance": {"Package": "navigation_1",
                             "Initial Value": 0,
                             "End Value": 0,
                             "Process": self.navigation_p,
                             "Process Set Value Method": self.navigation_p.set_nav_distance_and_time,
                             "Package List Name": self.var_navigation_navi1},
            "DestHour": {"Package": "navigation_1",
                         "Initial Value": 0,
                         "End Value": 0,
                         "Process": self.navigation_p,
                         "Process Set Value Method": self.navigation_p.set_nav_distance_and_time,
                         "Package List Name": self.var_navigation_navi1},
            "DestMinute": {"Package": "navigation_1",
                           "Initial Value": 0,
                           "End Value": 0,
                           "Process": self.navigation_p,
                           "Process Set Value Method": self.navigation_p.set_nav_distance_and_time,
                           "Package List Name": self.var_navigation_navi1},
            "NextCrossDistance": {"Package": "navigation_1",
                                  "Initial Value": 0,
                                  "End Value": 0,
                                  "Process": self.navigation_p,
                                  "Process Set Value Method": self.navigation_p.set_nav_distance_and_time,
                                  "Package List Name": self.var_navigation_navi1},
        }

    def set_up(self):
        self.duration = 0
        self.start_time = 0
        self.navigation_flag = False

    def set_duration(self, duration):
        self.duration = float(duration)

    def start_send(self):
        self.stop_flag.clear()
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

        if self.navigation_flag:
            self.navigation_thread = MyLoopTimer(self.stop_flag, self.navigation_cycle_time, self.send_navi_callback,
                                                 (self.navigation_cycle_time,))
            self.threads.append(self.navigation_thread)

        for t in self.threads:
            t.start()

        self.start_time = time.time()
        logging.debug("start_time:" + str(self.start_time))
        self.stop_flag.wait(self.duration)
        self.stop_send()

    def stop_send(self):
        # this will stop the timer
        self.stop_flag.set()
        for t in self.threads:
            t.join()
            del t
        self.threads.clear()

    def send_callback(self, inc, time_li):
        if self.stop_flag.isSet():
            return

        try:
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
                            current_value = round(init_value + (end_value -
                                                                init_value) * eclipse_time / self.duration, 1)
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
        except Exception as e:
            logging.error(e)
            self.stop_flag.set()

    def send_navi_callback(self, inc):
        if self.stop_flag.isSet():
            return

        try:
            eclipse_time = time.time() - self.start_time

            logging.debug("eclipse_time:" + str(eclipse_time))
            for package_key, package_value in self.navigation_package_list.items():
                parameters = ()
                for key, value in self.navigation_values.items():
                    if value['Package'] == package_key:
                        init_value = value["Initial Value"]
                        end_value = value["End Value"]

                        logging.debug("init " + key + ":" + str(init_value))
                        logging.debug("end " + key + ":" + str(end_value))
                        logging.debug("duration:" + str(self.duration))
                        if init_value != end_value:
                            current_value = round(init_value + (end_value -
                                                                init_value) * eclipse_time / self.duration, 1)
                        else:
                            current_value = init_value

                        logging.debug("current " + key + ":" + str(current_value))
                        parameters += (current_value,)

                if len(parameters) > 0:
                    value["Process Set Value Method"](*parameters)
                    self.set_navigation(value["Package List Name"],
                                        value["Process"].get_data())

                    msg_id = package_value[0]
                    msg_data = package_value[1]
                    logging.debug(
                        "inc" + str(inc) + "-" + package_key + "-msg_id" + str(msg_id) + "-msg_data" + str(msg_data))
                    with self.lock:
                        send_status = self.can_serial.send_data(msg_id, msg_data)
                    logging.debug("after send data inc" + str(inc) + ":" + str(time.time()))

                    if send_status == 1:
                        logging.debug("发送成功")
                    elif send_status == -1:
                        logging.debug("请生成数据")
                    else:
                        logging.error("发送失败")

        except Exception as e:
            logging.error(e)
            self.stop_flag.set()

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

    def set_initial_navigation_value(self, key, value):
        """
        set initial value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_initial_value:" + str(value))
        self.navigation_values.get(key)["Initial Value"] = float(value)

    def set_end_navigation_value(self, key, value):
        """
        set end value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_end_value:" + str(value))
        self.navigation_values.get(key)["End Value"] = float(value)

    def set_navigation(self, key, value):
        data_tuple = self.navigation_package_list.get(key)
        data_tuple[1] = value[1]
        self.navigation_flag = True
