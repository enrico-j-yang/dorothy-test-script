# -*- coding: utf-8 -*-
# language: zh-CN

功能: 车速
============================================
    车速
    
    @TPMS
    场景:	胎压报警状态正常
        当      CANBUS上胎压报警状态为正常
        而且    CANBUS上信号持续3秒
        那么    HUD不显示胎压报警
    
    @TPMS
    场景:	胎压报警状态系统故障
        当      CANBUS上胎压报警状态为正常
        而且    CANBUS上信号持续3秒
        那么    HUD不显示胎压报警
        
        当      CANBUS上胎压报警状态为系统故障
        而且    CANBUS上信号持续3秒
        那么    HUD显示胎压报警
        
    @TPMS
    场景:	胎压报警状态系统自检
        当      CANBUS上胎压报警状态为正常
        而且    CANBUS上信号持续3秒
        那么    HUD不显示胎压报警
        
        当      CANBUS上胎压报警状态为系统自检
        而且    CANBUS上信号持续3秒
        那么    HUD不显示胎压报警
        
    @TPMS
    场景:	胎压报警状态为保留值
        当      CANBUS上胎压报警状态为正常
        而且    CANBUS上信号持续3秒
        那么    HUD不显示胎压报警
        
        当      CANBUS上胎压报警状态为保留值
        而且    CANBUS上信号持续3秒
        那么    HUD不显示胎压报警
        
    @TPMS
    场景:	胎压报警状态失效，使用最后一次的有效值显示
        当      CANBUS上胎压报警状态为正常
        而且    CANBUS上信号持续3秒
        那么    HUD不显示胎压报警
        
        当      CANBUS上胎压报警状态为系统故障
        而且    CANBUS上信号持续3秒
        那么    HUD显示胎压报警
        
        当      CANBUS上信号断开3秒
        那么    HUD显示胎压报警

    @CRC
    场景:	TPMS CRC校验错误
        当      CANBUS上胎压报警状态为正常
        而且    CANBUS上信号持续3秒
        那么    HUD不显示胎压报警

        当      CANBUS上胎压报警状态为系统故障
        而且    CANBUS上TPMS的CRC校验错误
        而且    CANBUS上信号持续3秒
        那么    HUD显示胎压报警
