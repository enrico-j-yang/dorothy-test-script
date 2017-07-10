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
    _limit_control_status_data = [
        (0, 'Off'),
        (1, 'Standby'),
        (2, 'Active'),
        (3, 'Reserved')
    ]

    _cruise_control_status_data = [
        (0, 'Off'),
        (1, 'Standby'),
        (2, 'Active'),
        (3, 'Override')
    ]

    _engine_running_status_data = [
        (0, 'EngineOff'),
        (1, 'PowerOn'),
        (2, 'Cranking'),
        (3, 'Running'),
        (4, 'Stopping'),
        (5, 'Stopped'),
        (6, 'Reserved1'),
        (7, 'Reserved2')
    ]

    def __init__(self):
        super().__init__(0x118)

    def set_rpm(self, rpm):
        self.set_data_auto(1, int(rpm / 4))

    def set_rpm_valid(self, valid):
        self.set_data_bit_auto(2, 0, valid)

    # 第3个字节完整表示限速速度
    def set_limit_speed(self, limit_speed):
        self.set_data_auto(3, limit_speed)

    # 第4个字节低位0~1位代表限速状态
    def set_limit_status(self, status):
        self.set_data_bits_auto(4, 0, 1, [tup for tup in self._limit_control_status_data if tup[1] == status][0][0])

    # 第4个字节低位2~3位代表巡航状态
    def set_cruise_status(self, status):
        self.set_data_bits_auto(4, 2, 3, [tup for tup in self._cruise_control_status_data if tup[1] == status][0][0])

    def set_engine_status(self, status):
        self.set_data_bits_auto(5, 0, 2, [tup for tup in self._engine_running_status_data if tup[1] == status][0][0])


class IndicatorP(Processer):
    _indicator_status_data = [
        (0, 'Off'),
        (1, 'On')
    ]

    def __init__(self):
        super().__init__(0x214)

    def set_cruise_indicate(self, value):
        self.set_data_bit_auto(5, 2, [tup for tup in self._indicator_status_data if tup[1] == value][0][0])

    def set_cruise_unavail_display(self, value):
        self.set_data_bit_auto(5, 3, [tup for tup in self._indicator_status_data if tup[1] == value][0][0])

    def set_limit_indicate(self, value):
        self.set_data_bit_auto(5, 4, [tup for tup in self._indicator_status_data if tup[1] == value][0][0])

    def set_limit_unavail_display(self, value):
        self.set_data_bit_auto(5, 5, [tup for tup in self._indicator_status_data if tup[1] == value][0][0])

# limit_speed = LimitSpeedP()
# limit_speed.set_limit_speed(40)
# limit_speed.set_status(2)
# print(limit_speed.get_msg_id())
# print(limit_speed.get_data())

# sp = SpeedP()
# sp.set_speed(240)
# print(sp.get_data())
