# -- coding: utf-8 --
from can_sim.process import *


class TireP(Processer):

    """轮胎状态协议数据封装器"""
    def __init__(self):
        super().__init__(0x269)

    """
    第0个字节低3位表示系统当前状态
    0正常，1系统自检，2系统故障，3~7预留
    """
    def set_system_status(self, status):
        self.set_data_bits_auto(0, 0, 2, status)

    """
    第0个字节4、5、6位表示轮位
    0右后，1右前，2左后，3左前，4~7预留
    """
    def set_tire_id(self, tire_id):
        self.set_data_bits_auto(0, 4, 6, tire_id)

    """
    第0个字节高4位中最后一位位表示胎压信号状态
    0正常，1信号异常
    """
    def set_tire_validity(self, validity):
        self.set_data_bit_auto(0, 7, validity)

    """
    第1个字节低位0~1位表示轮胎漏气状态
    0正常，1快速漏气，2慢速漏气
    """
    def set_tire_leak(self, status):
        self.set_data_bits_auto(1, 0, 1, status)

    """
    第1个字节低位2~3位表示轮胎学习状态
    0未学习，1学习中，2学习完成，3学习失败
    """
    def set_tire_learning_status(self, status):
        self.set_data_bits_auto(1, 2, 3, status)

    """
    第1个字节4~5位表示轮胎胎压状态
    0正常，1过压，2欠压
    """
    def set_tire_pressure_status(self, status):
        self.set_data_bits_auto(1, 4, 5, status)

    """
    第1个字节6~7位表示轮胎温度状态
    0正常，1超高温，2高温
    """
    def set_tire_temperature_status(self, status):
        self.set_data_bits_auto(1, 6, 7, status)

    """
    第2个字节完整表示轮胎压力值
    """
    def set_tire_pressure(self, pressure):
        self.set_data_auto(2, pressure)


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
