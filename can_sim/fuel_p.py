# -- coding: utf-8 --
from can_sim.process import *


class FuelP(Processer):
    _indicator_status_data = [
        (0, 'Off'),
        (1, 'On')
    ]

    """燃油协议数据封装器"""
    def __init__(self):
        super().__init__(0x345)

    def set_fuel(self, fuel):
        self.set_data_auto(0, int(fuel))

    def set_driver_seat_belt_warning(self, value):
        self.set_data_bit_auto(5, 3, [tup for tup in self._indicator_status_data if tup[1] == value][0][0])

    def set_passenger_seat_belt_warning(self, value):
        self.set_data_bit_auto(5, 4, [tup for tup in self._indicator_status_data if tup[1] == value][0][0])


# fuel = FuelP()
# fuel.set_fuel(75)
# print(fuel.get_msg_id())
# print(fuel.get_data())
