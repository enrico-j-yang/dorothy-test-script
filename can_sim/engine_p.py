# -- coding: utf-8 --
from can_sim.process import *


class CoolantTemperatureP(Processer):

    """引擎冷却剂数据封装器"""
    def __init__(self):
        super().__init__(0x2F2)

    # 第0个字节完整表示引擎冷却剂温度，取值范围-40~215，数据偏移-40
    def set_temperature(self, temperature):
        temperature = temperature + 40
        self.set_data_auto(0, int(temperature))

    # 第2个字节低位第0位表示引擎冷却剂温度是否有效
    def set_status(self, status):
        self.set_data_bit_auto(2, 0, status)


# coolant = CoolantTemperatureP()
# coolant.set_temperature(40)
# coolant.set_status(1)
# print(coolant.get_msg_id())
# print(coolant.get_data())
