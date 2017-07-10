# -- coding: utf-8 --
import time
import sched
import threading
from can_sim.navigation_p import *


class NavScript(object):

    # 0 无定义, 1 自车图标, 2 左转, 3 右转, 4 左前方, 5 右前方, 6 左后方,
    # 7 右后方, 8 左转掉头, 9 直行, 10 到达途经点, 11 进入环岛, 12 驶出环岛,
    # 13 到达服务区, 14 到达收费站, 15 到达目的地, 16 到达隧道, 17 通过人行横道,
    # 18 通过过街天桥, 19 通过地下通道, 20 通过广场, 21 通过公园, 22 通过扶梯,
    # 23 通过直梯, 24 通过索道, 25 通过空中通道, 26 通过通道、建筑物穿越通道,
    # 27 通过行人道路, 28 通过游船路线, 29 通过观光车路线, 30 通过滑道, 31 通过阶梯
    road_type_mapping = {
        0: 0,
        1: 0,
        2: 1,
        3: 2,
        4: 10,
        5: 15,
        6: 11,
        7: 18,
        8: 3,
        9: 0,
        10: 201,
        11: 40,
        12: 44,  # 驶出环岛有N个方向，由于没有明确指明暂时用直行驶出
        13: 83,
        14: 36,
        15: 218,
        16: 33,
        17: 0,  # 通过人行横道用直行代替
        18: 0,  # 通过过街天桥用直行代替
        19: 0,  # 用直行代替
        20: 0,  # 用直行代替
        21: 0,  # 用直行代替
        22: 0,  # 用直行代替
        23: 0,  # 用直行代替
        24: 0,  # 用直行代替
        25: 0,  # 用直行代替
        26: 0,  # 用直行代替
        27: 0,  # 用直行代替
        28: 0,  # 用直行代替
        29: 0,  # 用直行代替
        30: 0,  # 用直行代替
        31: 0,  # 用直行代替
    }

    file = None
    interupt = True
    schedule = sched.scheduler(time.time, time.sleep)
    thread_controll = None
    car_speed = 30  # 当前车速km/h,根据车速动态进行导航测试
    nav_p = None
    can_serial = None
    log_frame = None

    cache_line = []
    t = None

    """docstring for NavScript"""
    def __init__(self, can_serial):
        super(NavScript, self).__init__()
        self.nav_p = NavigationP()
        self.can_serial = can_serial

    def set_car_speed(self, speed):
        if speed <= 0:
            speed = 1
        self.car_speed = speed
        if self.is_alive():
            self.interupt = True
            for event in self.schedule.queue:
                self.schedule.cancel(event)
            self.schedule.enter(1, 0, self.read_file_callback)
            self.interupt = False
            if self.thread_controll is not None:
                self.thread_controll.cancel()
            self.thread_controll = threading.Timer(1, self.thread_start)
            self.thread_controll.start()
            # print("当前车速%d,1秒后继续" % speed)

    def set_log_frame(self, log_frame):
        self.log_frame = log_frame

    def is_alive(self):
        return not self.interupt

    def thread_start(self):
        self.t = threading.Thread(target=self.schedule.run)
        self.t.setDaemon(True)
        self.t.start()

    def start(self):
        # 文件不存在会抛出FileNotFoundError
        self.file = open("nav_file/navigation.txt", encoding="utf-8")
        self.interupt = False
        # 初始化2行数据到缓存区
        for i in range(0, 2):
            line = self.file.readline()
            self.cache_line.append(line)

        # 0秒后立刻开始线程
        self.schedule.enter(0, 0, self.read_file_callback)
        self.thread_start()
        self.log_frame.add_log("导航测试开始")

    def stop(self):
        self.interupt = True
        self.file.close()
        self.cache_line.clear()
        self.log_frame.add_log("导航测试停止")

    # 线程循环读取文件
    def read_file_callback(self):
        if self.interupt is True:
            return

        if len(self.cache_line) <= 0:
            print("导航结束")
            self.log_frame.add_log("导航测试结束")
            return

        inc = 0
        # 文件格式错误，转换类型异常
        try:
            inc = self.process_source(self.cache_line)
        except ValueError:
            if self.log_frame is not None:
                self.log_frame.add_log("导航脚本格式错误")

        line = self.file.readline()
        if line:
            # 入队
            self.cache_line.append(line)

        # print("%f秒后执行下一句" % inc)

        # 出队第一项数据
        self.cache_line.pop(0)
        self.schedule.enter(inc, 0, self.read_file_callback)

    # 处理源数据
    def process_source(self, cache_line):
        source = cache_line[0].replace("\n", "")
        source_arr = source.split(",")
        inc = 0  # 下一条路口数据多少秒后执行
        if len(cache_line) >= 2:
            # 根据时速计算下一条数据时间
            target = cache_line[1].replace("\n", "")
            target_arr = target.split(",")
            # print("下一个路口距离%d" % int(target_arr[5]))
            # print("当前路口距离%d" % int(source_arr[5]))
            # print("时速%dm/s" % (self.car_speed * 1000.0 / 3600.0))
            remain = 0
            if int(target_arr[5]) > int(source_arr[5]):
                remain = int(source_arr[5])
            else:
                remain = (int(source_arr[5]) - int(target_arr[5]))

            inc = remain / (self.car_speed * 1000.0 / 3600.0)

        # set_nav_distance_and_time
        dt_distance = int(source_arr[7]) / 100
        dt_hours = int(source_arr[8]) / 60 / 60
        dt_minutes = int(source_arr[8]) / 60
        ncr_distance = int(source_arr[5])
        # print("到目的地剩余距离:%d" % dt_distance)
        # print("到目的地剩余时间:%d小时%d分钟" % (dt_hours, dt_minutes))
        # print("到下一个路口剩余距离:%d" % ncr_distance)
        data = self.nav_p.set_nav_distance_and_time(
            int(dt_distance), int(dt_hours),
            int(dt_minutes), int(ncr_distance))
        self.send_data(data)

        # set_nav_crossroad_and_angle
        ncr_progress = 0  # todo 动态计算路口进度
        ncr_type = self.road_type_mapping[int(source_arr[4])]
        angle = 0
        data = self.nav_p.set_nav_crossroad_and_angle(
            ncr_progress, ncr_type, angle)
        # print("路口类型:%d" % ncr_type)
        self.send_data(data)

        # set_nav_road_names
        road_name = source_arr[2]
        # print("当前道路名:%s" % road_name)
        data = self.nav_p.set_nav_road_names(road_name)
        for d in data:
            self.send_data(d)

        # set_nav_e_dog
        cam_speed_limit = 0
        cam_type = int(source_arr[11])
        dest_dist = int(source_arr[10])
        if cam_type != -1:
            cam_type = 0 if cam_type == 2 else 1
            data = self.nav_p.set_nav_e_dog(
                cam_speed_limit, cam_type, dest_dist)
            # print("当前电子眼类型:%d" % cam_type)
            # print("电子眼距离:%d" % dest_dist)
            self.send_data(data)
        else:
            # 清空电子眼信息
            data = self.nav_p.set_nav_e_dog(
                0, 0xF, 0)
            self.send_data(data)

        return inc

    # 发送数据包
    def send_data(self, data):
        msg_id = int(self.nav_p.get_msg_id(), 16)
        msg_data = data[1]
        self.can_serial.send_data(msg_id, msg_data)


# nav = NavScript(None)
# nav.start()
# nav.stop()
