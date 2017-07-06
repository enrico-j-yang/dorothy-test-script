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
    init_speed = 0
    end_speed = 0
    start_time = 0

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
        self.navigation_p = NavigationP()

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

        try:
            time_li.index("speed")
        except ValueError:
            pass
        else:
            logging.debug("init_speed:" + str(self.init_speed))
            logging.debug("end_speed:" + str(self.end_speed))
            logging.debug("duration:" + str(self.duration))

        for val in time_li:
            if val == "speed":
                current_speed = int(self.init_speed + (self.end_speed -
                                                       self.init_speed) * eclipse_time / self.duration)

                logging.debug("current_speed:" + str(current_speed))
                self.speed_p.set_speed(int(current_speed))

            msg_id = self.package_list.get(val)[0]
            msg_data = self.package_list.get(val)[1]
            logging.debug("inc" + str(inc) + "-" + val + "-msg_id" + str(msg_id) + "-msg_data" + str(msg_data))
            with self.lock:
                # send_status = self.can_serial.send_data(msg_id, msg_data)
                logging.debug("after send data inc" + str(inc) + ":" + str(time.time()))
                '''
                if send_status == 1:
                    logging.debug("发送成功")
                elif send_status == -1:
                    logging.debug("请生成数据")
                else:
                    logging.error("发送失败")
                '''

    def set_initial_speed(self, speed):
        """
        set signal period for control board
        :param speed: speed in km/s
        :return: None
        """
        logging.debug("set_initial_speed:" + str(speed))
        self.init_speed = int(speed)

    def set_end_speed(self, speed):
        """
        set signal period for control board
        :param speed: speed in km/s
        :return: None
        """
        logging.debug("set_end_speed:" + str(speed))
        self.end_speed = int(speed)
