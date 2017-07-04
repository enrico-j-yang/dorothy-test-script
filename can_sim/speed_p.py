# -- coding: utf-8 --
from can_sim.process import *


class SpeedP(Processer):

    """时速协议数据封装器"""
    def __init__(self):
        super().__init__(0x25F)

    # 第1个字节完整表示当前车速
    def set_speed(self, speed):
        self.set_data_auto(1, speed)


class LimitSpeedP(Processer):

    """燃油协议数据封装器"""
    def __init__(self):
        super().__init__(0x118)

    # 第3个字节完整表示限速速度
    def set_limit_speed(self, limit_speed):
        self.set_data_auto(3, limit_speed)

    # 第4个字节低位2~3位代表状态
    def set_status(self, status):
        self.set_data_bits_auto(4, 2, 3, status)


# limit_speed = LimitSpeedP()
# limit_speed.set_limit_speed(40)
# limit_speed.set_status(2)
# print(limit_speed.get_msg_id())
# print(limit_speed.get_data())

# sp = SpeedP()
# sp.set_speed(240)
# print(sp.get_data())
