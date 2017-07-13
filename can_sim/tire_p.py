# -- coding: utf-8 --
from can_sim.process import *


class TireP(Processer):
    _system_status_data = [
        (0, 'Normal'),
        (1, 'SelfCheck'),
        (2, 'SystemFailure'),
        (3, 'Reserved'),
        (4, 'Reserved2'),
        (5, 'Reserved3'),
        (6, 'Reserved4'),
        (7, 'Reserved5')
    ]
    _tire_id_data = [
        (0, 'RightRear'),
        (1, 'RightFront'),
        (2, 'LeftRear'),
        (3, 'LeftFront'),
        (4, 'Reserved'),
        (5, 'Reserved2'),
        (6, 'Reserved3'),
        (7, 'Reserved4')
    ]
    _tire_information_data = [
        (0, 'Valid'),
        (1, 'Invalid')
    ]
    _tire_leak_data = [
        (0, 'Normal'),
        (1, 'FastLeak'),
        (2, 'SlowLeak'),
        (3, 'Reserved')
    ]
    _tire_learning_status_data = [
        (0, 'NoLearn'),
        (1, 'Learning'),
        (2, 'LearnCompleted'),
        (3, 'LearnFailed')
    ]
    _tire_pressure_status_data = [
        (0, 'Normal'),
        (1, 'OverPressure'),
        (2, 'UnderPressure'),
        (3, 'Reserved')
    ]
    _tire_temperature_status_data = [
        (0, 'Normal'),
        (1, 'SuperHighTemperature'),
        (2, 'HighTemperature'),
        (3, 'Reserved')
    ]
    _tire_battery_power_data = [
        (26, 'Reserved'),
        (255, 'Invalid')
    ]
    _tire_battery_power_status_data = [
        (0, 'Normal'),
        (1, 'LowBattery'),
        (2, 'Reserved'),
        (3, 'Reserved2')
    ]
    """轮胎状态协议数据封装器"""

    def __init__(self):
        super().__init__(0x269)

    """
    第0个字节低3位表示系统当前状态
    0正常，1系统自检，2系统故障，3~7预留
    """

    def set_system_status(self, status):
        self.set_data_bits_auto(0, 0, 2, [tup for tup in self._system_status_data if tup[1] == status][0][0])

    """
    第0个字节4、5、6位表示轮位
    0右后，1右前，2左后，3左前，4~7预留
    """

    def set_tire_id(self, tire_id):
        self.set_data_bits_auto(0, 4, 6, [tup for tup in self._tire_id_data if tup[1] == tire_id][0][0])

    """
    第0个字节高4位中最后一位位表示胎压信号状态
    0正常，1信号异常
    """

    def set_tire_validity(self, validity):
        self.set_data_bit_auto(0, 7, [tup for tup in self._tire_information_data if tup[1] == validity][0][0])

    """
    第1个字节低位0~1位表示轮胎漏气状态
    0正常，1快速漏气，2慢速漏气
    """

    def set_tire_leak(self, status):
        self.set_data_bits_auto(1, 0, 1, [tup for tup in self._tire_leak_data if tup[1] == status][0][0])

    """
    第1个字节低位2~3位表示轮胎学习状态
    0未学习，1学习中，2学习完成，3学习失败
    """

    def set_tire_learning_status(self, status):
        self.set_data_bits_auto(1, 2, 3, [tup for tup in self._tire_learning_status_data if tup[1] == status][0][0])

    """
    第1个字节4~5位表示轮胎胎压状态
    0正常，1过压，2欠压
    """

    def set_tire_pressure_status(self, status):
        self.set_data_bits_auto(1, 4, 5, [tup for tup in self._tire_pressure_status_data if tup[1] == status][0][0])

    """
    第1个字节6~7位表示轮胎温度状态
    0正常，1超高温，2高温
    """

    def set_tire_temperature_status(self, status):
        self.set_data_bits_auto(1, 6, 7, [tup for tup in self._tire_temperature_status_data if tup[1] == status][0][0])

    """
    第2个字节完整表示轮胎压力值
    """

    def set_tire_pressure(self, pressure):
        self.set_data_auto(2, int(pressure / 1.3725))

    """
    第3个字节完整表示轮胎温度值
    """

    def set_tire_temperature(self, temperature):
        self.set_data_auto(3, int(temperature))

    """
    第3个字节完整表示胎压监测模块电池电量
    """

    def set_tire_battery_power(self, pressure):
        self.set_data_auto(3, [tup for tup in self._tire_battery_power_data if tup[1] == pressure][0][0])

    """
    第5个字节0~1位表示轮胎电池电量状态
    0正常，1低电量，2预留， 3预留
    """

    def set_tire_battery_power_status(self, status):
        self.set_data_bits_auto(5, 0, 1,
                                [tup for tup in self._tire_battery_power_status_data if tup[1] == status][0][0])

# tire = TireP()
# tire.set_system_status(2)
# tire.set_tire_id(2)
# tire.set_tire_validity(1)
# tire.set_tire_leak(1)
# tire.set_tire_learning_status(2)
# tire.set_tire_pressure_status(2)
# tire.set_tire_temperature_status(1)
# tire.set_tire_pressure(255)
# print(tire.get_msg_id())
# print(tire.get_data())
