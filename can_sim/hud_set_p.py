# -- coding: utf-8 --
from can_sim.process import *


class HudSetP(Processer):

    """HUD亮度设置和角度设置的状态"""
    def __init__(self):
        super().__init__(0x330)

    # 第7个字节低位0~1位表示hud亮度调节状态
    def set_brightness_state(self, state):
        self.set_data_bits_auto(7, 0, 1, state)

    # 第7个字节低位2~3位表示hud角度调节状态
    def set_hudAngle_state(self, state):
        self.set_data_bits_auto(7, 2, 3, state)


# hud = HudSetP()
# hud.set_brightness_state(1)
# hud.set_hudAngle_state(2)
# print(hud.get_msg_id())
# print(hud.get_data())
