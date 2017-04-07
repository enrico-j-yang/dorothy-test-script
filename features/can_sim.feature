# -*- coding: utf-8 -*-
# language: zh-CN

功能: EMS_4
============================================
    EMS_4
    
    @RPM
    场景:	固定引擎转速
        当      CANBUS上有引擎转速为1000
        而且    CANBUS上有合法引擎转速
        而且    CANBUS上限速控制状态为关闭
        而且    CANBUS上巡航控制状态为关闭
        而且    CANBUS上限速巡航速度为不可用
        而且    CANBUS上引擎转速持续1秒
        那么    HUD显示引擎转速为1000
    
    @RPM
    场景:	引擎转速在3秒内从0增加到10000
        当      CANBUS上有引擎转速为0
        而且    CANBUS上有合法引擎转速
        而且    CANBUS上限速控制状态为关闭
        而且    CANBUS上巡航控制状态为关闭
        而且    CANBUS上限速巡航速度为不可用
        而且    CANBUS上引擎转速在3秒内增加到10000
        那么    HUD显示引擎转速在3秒内从0增加到10000
        
    @RPM
    场景:	引擎转速在3秒内从10000下降到0
        当      CANBUS上有引擎转速为10000
        而且    CANBUS上有合法引擎转速
        而且    CANBUS上限速控制状态为关闭
        而且    CANBUS上巡航控制状态为关闭
        而且    CANBUS上限速巡航速度为不可用
        而且    CANBUS上引擎转速在3秒内从10000下降到0
        那么    HUD显示引擎转速在3秒内从10000下降到0
        
    @LimitControl
    场景:	开启限速控制
        当      CANBUS上有引擎转速为1000
        而且    CANBUS上有合法引擎转速
        而且    CANBUS上限速控制状态为准备中
        而且    CANBUS上巡航控制状态为关闭
        而且    CANBUS上限速巡航速度为不可用
        
        当      CANBUS上限速主开关灯指示为打开
        而且    CANBUS上限速激活状态灯为关闭
        而且    CANBUS上巡航主开关灯指示为关闭
        而且    CANBUS上巡航激活状态灯为关闭
        
        而且    CANBUS上信号持续1秒
        
        当      CANBUS上限速控制状态为激活
        而且    CANBUS上限速巡航速度为60
        而且    CANBUS上限速激活状态灯为打开
        
        而且    CANBUS上信号持续1秒
        
        那么    HUD显示限速图标，限速60km/h
        
    @LimitControl
    场景:	关闭限速控制
        当      CANBUS上限速控制状态为激活
        而且    CANBUS上有引擎转速为1000
        而且    CANBUS上有合法引擎转速
        而且    CANBUS上限速巡航速度为60
        而且    CANBUS上巡航控制状态为关闭
        
        当      CANBUS上限速激活状态灯为打开
        而且    CANBUS上限速主开关灯指示为打开
        而且    CANBUS上巡航主开关灯指示为关闭
        而且    CANBUS上巡航激活状态灯为关闭
        
        而且    CANBUS上信号持续1秒
        
        那么    HUD显示限速图标，限速60km/h
        
        而且    HUD显示限速激活状态灯
        而且    CANBUS上限速控制状态为关闭
        而且    CANBUS上限速巡航速度为不可用
        
        而且    CANBUS上信号持续1秒
        
        那么    HUD显示限速图标消失
        
    @CruiseControl
    场景:	开启巡航控制
        当      CANBUS上有引擎转速为1000
        而且    CANBUS上有合法引擎转速
        而且    CANBUS上巡航控制状态为准备中
        而且    CANBUS上限速控制状态为关闭
        而且    CANBUS上限速巡航速度为不可用
        
        当      CANBUS上巡航主开关灯指示为打开
        而且    CANBUS上巡航激活状态灯为关闭
        而且    CANBUS上限速主开关灯指示为关闭
        而且    CANBUS上限速激活状态灯为关闭
        
        而且    CANBUS上信号持续1秒
        
        当      CANBUS上巡航控制状态为激活
        而且    CANBUS上限速巡航速度为60
        而且    CANBUS上巡航激活状态灯为打开
        
        而且    CANBUS上信号持续1秒
        
        那么    HUD显示巡航图标，巡航60km/h
        
    @CruiseControl
    场景:	关闭巡航控制
        当      CANBUS上巡航控制状态为激活
        而且    CANBUS上有引擎转速为1000
        而且    CANBUS上有合法引擎转速
        而且    CANBUS上限速巡航速度为60
        而且    CANBUS上限速控制状态为关闭
        
        当      CANBUS上巡航激活状态灯为打开
        而且    CANBUS上巡航主开关灯指示为打开
        而且    CANBUS上限速主开关灯指示为关闭
        而且    CANBUS上限速激活状态灯为关闭
        
        而且    CANBUS上信号持续1秒
        
        那么    HUD显示巡航图标，巡航60km/h
        
        而且    HUD显示巡航激活状态灯
        而且    CANBUS上巡航控制状态为关闭
        而且    CANBUS上限速巡航速度为不可用
        
        而且    CANBUS上信号持续1秒
        
        那么    HUD显示巡航图标消失