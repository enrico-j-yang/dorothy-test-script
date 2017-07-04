# -- coding: utf-8 --
import time, os, sched, threading


class PackageSet(object):
    var_coolant_temp = "coolant_temp"
    var_fuel = "fuel"
    var_hud_set = "hud_set"
    var_ldw = "ldw"
    var_speed = "speed"
    var_limit_speed = "limit_speed"
    var_tire = "tire"

    schedule = sched.scheduler(time.time, time.sleep)

    threads = []

    cycle_time = [0.01, 0.05, 0.1, 1]
    # cycle_time = [1, 2, 3, 4]

    default_data = [0] * 8

    package_list = {
        var_coolant_temp: [0x2F2, default_data, cycle_time[3]],
        var_fuel: [0x345, default_data, cycle_time[2]],
        var_hud_set: [0x330, default_data, cycle_time[2]],
        var_ldw: [0x360, default_data, cycle_time[1]],
        var_speed: [0x25F, default_data, cycle_time[1]],
        var_limit_speed: [0x118, default_data, cycle_time[0]],
        var_tire: [0x269, default_data, cycle_time[2]]
    }

    send_one_msg_id = 0  # 报文标识符源数据
    send_one_msg_data = 0  # 报文数据包源数据

    can_serial = None
    interupt = False

    """docstring for PackageSet"""

    def __init__(self, can_serial):
        super(PackageSet, self).__init__()
        self.can_serial = can_serial

    def set(self, key, value):
        data_tuple = self.package_list.get(key)
        data_tuple[1] = value[1]

    def record_one_time_data(self, msg_id, msg_data):
        self.send_one_msg_id = msg_id
        self.send_one_msg_data = msg_data

    """
    单次发送分两种情况，一种为单数据包，一种为多数据包，如导航路名数据包
    当为多数据包时，msg_data应封装为tuple用于区别单数据包
    封装格式 msg_data = (msg_data, )
    """

    def send_one_time(self):
        if self.send_one_msg_data == 0:
            return -1
        # print("发送数据%d,%s" % (self.send_one_msg_id, self.send_one_msg_data))
        send_status = 1
        is_tuple = isinstance(self.send_one_msg_data, tuple)
        if is_tuple:
            for msg_data in self.send_one_msg_data[0]:
                # print("发送数据:%s" % msg_data)
                one_status = self.can_serial.send_data(self.send_one_msg_id,
                                                       msg_data)
                if one_status == 0:
                    send_status = 0
                    break
        else:
            send_status = self.can_serial.send_data(self.send_one_msg_id,
                                                    self.send_one_msg_data)
        return send_status

    def start_send(self):
        self.interupt = False
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
                        if (val[0] > self.package_list.get(id_li[id_i])[0]):
                            target_i += 1
                    id_li.insert(target_i, key)

            time_li.append(id_li)

        # 把处理完的list放入线程
        for i in range(0, len(time_li)):
            # 开启一条线程
            self.schedule.enter(self.cycle_time[i], 0,
                                self.send_callback,
                                (self.cycle_time[i], time_li[i]))
            t = threading.Thread(target=self.schedule.run)
            self.threads.append(t)

        for t in self.threads:
            t.setDaemon(True)
            t.start()

    def stop_send(self):
        self.interupt = True
        for s in self.schedule.queue:
            self.schedule.cancel(s)
        for t in self.threads:
            del t
        self.threads.clear()

    def send_callback(self, inc, time_li):
        if self.interupt is True:
            return
        for val in time_li:
            msg_id = self.package_list.get(val)[0]
            msg_data = self.package_list.get(val)[1]
            self.can_serial.send_data(msg_id, msg_data)
        current_time = time.strftime(
            '%H:%M:%S', time.localtime(time.time()))
        # print(current_time)
        self.schedule.enter(inc, 0,
                            self.send_callback, (inc, time_li))

    def connect(self):
        return self.can_serial.open_serial()

    def disconnect(self):
        return self.can_serial.close_serial()

# p = PackageSet()
# p.start_send()
# p.set(p.var_speed, "test")
# print(p.package_list.get(p.var_speed)[1])
# print(p.package_list.get(p.var_ldw)[1])
# schedule = sched.scheduler(time.time, time.sleep)
