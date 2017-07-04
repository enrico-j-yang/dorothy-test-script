# -- coding: utf-8 --
from can_sim.process import *


class FuelP(Processer):

    """燃油协议数据封装器"""
    def __init__(self):
        super().__init__(0x345)

    def set_fuel(self, fuel):
        self.set_data_auto(0, fuel)


# fuel = FuelP()
# fuel.set_fuel(75)
# print(fuel.get_msg_id())
# print(fuel.get_data())
