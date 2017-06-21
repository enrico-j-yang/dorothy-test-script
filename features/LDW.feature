# -*- coding: utf-8 -*-
# language: zh-CN

功能: 车道偏离
============================================
    车道偏离
        
    @LDW
    场景:	车道偏离系统状态为关闭
        假如    HUD车道偏离状态为关闭
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为无
        而且    CANBUS上车道偏离校准状态为未进行校正
        而且    CANBUS上信号持续3秒
        那么    HUD不显示车道偏离信息

    @LDW
    场景:	检测到车道
        假如    HUD车道偏离报警为关闭状态
        当      CANBUS上车道偏离状态为待机
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为无
        而且    CANBUS上车道偏离校准状态为校正中
        而且    CANBUS上信号持续3秒
        
        当      CANBUS上车道偏离校准状态为校正成功
        而且    CANBUS上车道偏离状态为系统激活
        而且    CANBUS上左车道偏离报警为检测到车道
        而且    CANBUS上右车道偏离报警为检测到车道
        而且    CANBUS上信号持续3秒
        那么    HUD显示检测到车道
    
    @LDW
    场景:	左侧偏离车道报警
        假如    HUD车道偏离状态为检测到车道
        而且    CANBUS上左车道偏离报警为警告
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为无
        而且    CANBUS上车道偏离校准状态为校准成功
        而且    CANBUS上信号持续3秒
        那么    HUD显示左侧压线报警
        
    @LDW
    场景:	右侧偏离车道报警
        假如    HUD车道偏离状态为检测到车道
        而且    CANBUS上右车道偏离报警为警告
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为无
        而且    CANBUS上车道偏离校准状态为校准成功
        而且    CANBUS上信号持续3秒
        那么    HUD显示右侧压线报警
        
    @LDW
    场景:	车道偏离摄像头遮挡
        假如    HUD车道偏离状态为摄像头覆盖
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为无
        而且    CANBUS上车道偏离校准状态为校准成功
        而且    CANBUS上信号持续3秒
        那么    HUD显示车道偏离摄像头遮挡
        
    @LDW
    场景:	车道偏离系统故障，通信丢失
        假如    HUD车道偏离状态为故障状态
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为通信丢失
        而且    CANBUS上车道偏离校准状态为校准成功
        而且    CANBUS上信号持续3秒
        那么    HUD显示车道偏离系统故障
        
    @LDW
    场景:	车道偏离系统故障，临时故障
        假如    HUD车道偏离状态为故障状态
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为临时故障
        而且    CANBUS上车道偏离校准状态为校准成功
        而且    CANBUS上信号持续3秒
        那么    HUD显示车道偏离系统故障
        
    @LDW
    场景:	车道偏离系统故障，永久故障
        假如    HUD车道偏离状态为故障状态
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为永久故障
        而且    CANBUS上车道偏离校准状态为校准成功
        而且    CANBUS上信号持续3秒
        那么    HUD显示车道偏离系统故障
        
    @LDW
    场景:	车道偏离系统故障，保留故障码
        假如    HUD车道偏离状态为故障状态
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为保留故障码
        而且    CANBUS上车道偏离校准状态为校准成功
        而且    CANBUS上信号持续3秒
        那么    HUD显示车道偏离系统故障
    
    @LDW
    场景:	左侧偏离车道报警为保留值
        假如    HUD车道偏离状态为检测到车道
        而且    CANBUS上左车道偏离报警为保留值
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为无
        而且    CANBUS上车道偏离校准状态为校准成功
        而且    CANBUS上信号持续3秒
        那么    HUD显示检测到车道
        
    @LDW
    场景:	右侧偏离车道报警为保留值
        假如    HUD车道偏离状态为检测到车道
        而且    CANBUS上右车道偏离报警为保留值
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为无
        而且    CANBUS上车道偏离校准状态为校准成功
        而且    CANBUS上信号持续3秒
        那么    HUD显示检测到车道
        
    @LDW
    场景:	车道偏离系统状态为标定状态
        假如    HUD车道偏离状态为标定状态
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为无
        而且    CANBUS上车道偏离校准状态为未进行校正
        而且    CANBUS上信号持续3秒
        那么    HUD不显示车道偏离信息
        
    @LDW
    场景:	车道偏离系统状态为保留值
        假如    HUD车道偏离状态为保留值
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为无
        而且    CANBUS上车道偏离校准状态为未进行校正
        而且    CANBUS上信号持续3秒
        那么    HUD不显示车道偏离信息
        
    @LDW
    场景:	车道偏离系统状态失效，使用最后一次有效值进行显示
        假如    HUD车道偏离报警为关闭状态
        当      CANBUS上车道偏离状态为待机
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为无
        而且    CANBUS上车道偏离校准状态为校正中
        而且    CANBUS上信号持续3秒
        
        当      CANBUS上车道偏离校准状态为校正成功
        而且    CANBUS上车道偏离状态为系统激活
        而且    CANBUS上左车道偏离报警为检测到车道
        而且    CANBUS上右车道偏离报警为检测到车道
        而且    CANBUS上信号持续3秒
        那么    HUD显示检测到车道
        
        当      CANBUS上信号断开3秒
        那么    HUD显示检测到车道
        

    @CRC
    场景:	LDW CRC校验错误
        假如    HUD车道偏离报警为关闭状态
        当      CANBUS上车道偏离状态为待机
        而且    CANBUS上左车道偏离报警为无显示
        而且    CANBUS上右车道偏离报警为无显示
        而且    CANBUS上车道偏离故障类型为无
        而且    CANBUS上车道偏离校准状态为校正中
        而且    CANBUS上信号持续3秒
        
        当      CANBUS上LDW的CRC校验错误
        而且    CANBUS上车道偏离校准状态为校正成功
        而且    CANBUS上车道偏离状态为系统激活
        而且    CANBUS上左车道偏离报警为检测到车道
        而且    CANBUS上右车道偏离报警为检测到车道
        而且    CANBUS上信号持续3秒
        那么    HUD不显示车道偏离信息
