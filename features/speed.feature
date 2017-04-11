# -*- coding: utf-8 -*-
# language: zh-CN

功能: 车速
============================================
    车速
    
    @speed
    场景:	固定速度
        当      CANBUS上有速度为60
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为60
    
    @speed
    场景:	速度在20秒内从0增加到254
        当      CANBUS上有速度为0
        而且    CANBUS上速度在20秒内增加到254
        那么    HUD显示速度在20秒内增加到254
        
    @speed
    场景:	速度在20秒内从254下降到0
        当      CANBUS上有速度为254
        而且    CANBUS上速度在20秒内从254下降到0
        那么    HUD显示速度在20秒内从254下降到0
        
    @speed
    场景:	非法速度
        当      CANBUS上有速度为255
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为0
        
    @speed
    场景:	速度失效，使用最后一次的有效值显示
        当      CANBUS上有速度为60
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为60
        
        当      CANBUS上信号断开2秒
        那么    HUD显示速度为60

        当      CANBUS上有速度为40
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为40
        
    @speed
    场景:	速度失效时间超过2.5秒
        当      CANBUS上有速度为60
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为60
        
        当      CANBUS上信号断开3秒
        那么    HUD显示速度为0

    @CRC
    场景:	IC_2 CRC校验错误
        当      CANBUS上有速度为60
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为60
        
        当      CANBUS上IC_2的CRC校验错误
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示速度为0
