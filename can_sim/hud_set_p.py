# -- coding: utf-8 --
from can_sim.process import *


class HudSetP(Processer):

    _display_mode_data = [
        (0, "Default"),
        (1, "Mode2"),
        (2, "Reserved")
    ]
    _hud_angle_state_data = [
        (0, "Not Change"),
        (1, "Increase Angle"),
        (2, "Reduce Angle"),
        (3, "Reserved")
    ]
    _brightness_state_data = [
        (0, "Not Change"),
        (1, "Enhance Brightness"),
        (2, "Reduce Brightness"),
        (3, "Reserved")
    ]

    """HUD亮度设置和角度设置的状态"""
    def __init__(self):
        super().__init__(0x330)

    def set_display_mode(self, mode):
        self.set_data_bits_auto(6, 5, 6, [tup for tup in self._display_mode_data if tup[1] == mode][0][0])

    # 第7个字节低位0~1位表示hud亮度调节状态
    def set_brightness_state(self, state):
        self.set_data_bits_auto(7, 0, 1, [tup for tup in self._brightness_state_data if tup[1] == state][0][0])

    # 第7个字节低位2~3位表示hud角度调节状态
    def set_hud_angle_state(self, state):
        self.set_data_bits_auto(7, 2, 3, [tup for tup in self._hud_angle_state_data if tup[1] == state][0][0])


# hud = HudSetP()
# hud.set_brightness_state(1)
# hud.set_hudAngle_state(2)
# print(hud.get_msg_id())
# print(hud.get_data())
