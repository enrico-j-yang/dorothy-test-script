# -*- coding: utf-8 -*-
# language: zh-CN

功能: 车速
  ============================================
  车速

  @speed, @debug
  场景:    固定速度
    当      CANBUS上有速度为60km/h
    而且    CANBUS上信号持续1秒
    那么    HUD显示速度为60km/h

  @speed
  场景:    速度在20秒内从0km/h增加到254km/h
    当      CANBUS上速度在20秒内从0km/h增加到254km/h
    那么    HUD显示速度在20秒内从0km/h增加到254km/h

  @speed
  场景:    速度在20秒内从254km/h下降到0km/h
    当      CANBUS上速度在20秒内从254km/h下降到0km/h
    那么    HUD显示速度在20秒内从254km/h下降到0km/h

  @speed
  场景:    非法速度
    当      CANBUS上有速度为255
    而且    CANBUS上信号持续1秒
    那么    HUD显示速度为0km/h

  @speed
  场景:    速度失效，使用最后一次的有效值显示
    当      CANBUS上有速度为60km/h
    而且    CANBUS上信号持续1秒
    那么    HUD显示速度为60km/h

    当      CANBUS上信号断开2秒
    那么    HUD显示速度为60km/h

    当      CANBUS上有速度为40km/h
    而且    CANBUS上信号持续1秒
    那么    HUD显示速度为40km/h

  @speed
  场景:    速度失效时间超过2.5秒
    当      CANBUS上有速度为60km/h
    而且    CANBUS上信号持续1秒
    那么    HUD显示速度为60km/h

    当      CANBUS上信号断开3秒
    那么    HUD显示速度为0km/h
