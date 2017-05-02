# -*- coding: utf-8 -*-
# language: zh-CN

功能: 车速
============================================
    车速
    
    @HUDSettings
    场景:	HUD显示模式为车速+导航+交通标识
        当      CANBUS上显示模式为0
        而且    CANBUS上信号持续1秒
        
        当      CANBUS上有速度为60km/h
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为60km/h
        
        当      CANBUS上当前道路名称数据首帧为映日路
        那么    HUD显示当前道路名称为映日路

        当      CANBUS上目的地距离值为2500km
        而且    CANBUS上到达目的地剩余时间值为88h33m
        而且    CANBUS上下一个路口的距离值为2km
        而且    CANBUS上信号持续3秒
        那么    HUD显示目的地距离为2500km
        而且    HUD显示到达目的地剩余时间为88h33m
        而且    HUD显示下一个路口的距离为2km

        当      CANBUS上到一下个路口的进度值为50%
        当      CANBUS上指北针角度为0
        而且    CANBUS上信号持续3秒
        那么    HUD显示到一下个路口的进度值为50%
        那么    HUD显示指北针方向为北
    
    @HUDSettings
    场景:	HUD显示模式为车速+交通标识
        当      CANBUS上显示模式为1
        而且    CANBUS上信号持续1秒
        
        当      CANBUS上有速度为60km/h
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为60km/h
        
        当      CANBUS上当前道路名称数据首帧为映日路
        那么    HUD不显示当前道路名称

        当      CANBUS上目的地距离值为2500km
        而且    CANBUS上到达目的地剩余时间值为88h33m
        而且    CANBUS上下一个路口的距离值为2km
        而且    CANBUS上信号持续3秒
        那么    HUD不显示目的地距离
        而且    HUD不显示到达目的地剩余时间
        而且    HUD不显示下一个路口的距离

        当      CANBUS上到一下个路口的进度值为50%
        当      CANBUS上指北针角度为0
        而且    CANBUS上信号持续3秒
        那么    HUD显示到一下个路口的进度值为50%
        那么    HUD显示指北针方向为北
        
    @HUDSettings
    场景:	HUD显示模式为车速+导航
        当      CANBUS上显示模式为2
        而且    CANBUS上信号持续1秒
        
        当      CANBUS上有速度为60km/h
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为60km/h
        
        当      CANBUS上当前道路名称数据首帧为映日路
        那么    HUD显示当前道路名称为映日路

        当      CANBUS上目的地距离值为2500km
        而且    CANBUS上到达目的地剩余时间值为88h33m
        而且    CANBUS上下一个路口的距离值为2km
        而且    CANBUS上信号持续3秒
        那么    HUD显示目的地距离为2500km
        而且    HUD显示到达目的地剩余时间为88h33m
        而且    HUD显示下一个路口的距离为2km

        当      CANBUS上到一下个路口的进度值为50%
        当      CANBUS上指北针角度为0
        而且    CANBUS上信号持续3秒
        那么    HUD不显示到一下个路口的进度值
        那么    HUD不显示指北针方向
        
    @HUDSettings
    场景:	HUD显示模式为车速
        当      CANBUS上显示模式为3
        而且    CANBUS上信号持续1秒
        
        当      CANBUS上有速度为60km/h
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为60km/h
        
        当      CANBUS上当前道路名称数据首帧为映日路
        那么    HUD不显示当前道路名称

        当      CANBUS上目的地距离值为2500km
        而且    CANBUS上到达目的地剩余时间值为88h33m
        而且    CANBUS上下一个路口的距离值为2km
        而且    CANBUS上信号持续3秒
        那么    HUD不显示目的地距离
        而且    HUD不显示到达目的地剩余时间
        而且    HUD不显示下一个路口的距离

        当      CANBUS上到一下个路口的进度值为50%
        当      CANBUS上指北针角度为0
        而且    CANBUS上信号持续3秒
        那么    HUD不显示到一下个路口的进度值
        那么    HUD不显示指北针方向
        
    @HUDSettings
    场景:	HUD显示模式失效，使用最后一次的有效值显示
        当      CANBUS上显示模式为0
        而且    CANBUS上信号持续1秒
        
        当      CANBUS上信号断开2秒
        那么    HUD显示速度为60km/h

        当      CANBUS上有速度为40km/h
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为40km/h
        
    @HUDSettings
    场景:	HUD亮度设置为默认
        假如    HUD显示亮度为默认
        当      CANBUS上HUD亮度设置为0
        而且    CANBUS上信号持续1秒
        那么    HUD显示亮度不改变
        
    @HUDSettings
    场景:	HUD亮度设置为增强
        假如    HUD显示亮度为默认
        当      CANBUS上HUD亮度设置为1
        而且    CANBUS上信号持续1秒
        那么    HUD显示亮度增强
        
    @HUDSettings
    场景:	HUD亮度设置为减弱
        假如    HUD显示亮度为默认
        当      CANBUS上HUD亮度设置为1
        而且    CANBUS上信号持续1秒
        那么    HUD显示亮度减弱
        
    @HUDSettings
    场景:	HUD亮度设置为保留值
        当      CANBUS上有速度为4
        而且    CANBUS上信号持续1秒
        那么    HUD显示亮度不改变
        
    @HUDSettings
    场景:	HUD亮度设置失效，使用最后一次的有效值显示
        假如    HUD显示亮度为默认
        当      CANBUS上HUD亮度设置为0
        而且    CANBUS上信号持续1秒
        那么    HUD显示亮度不改变
        
        当      CANBUS上信号断开2秒
        那么    HUD显示亮度不改变

        当      CANBUS上HUD亮度设置为1
        而且    CANBUS上信号持续1秒
        那么    HUD显示亮度增强
        
    @HUDSettings
    场景:	HUD角度设置为默认
        假如    HUD角度设置为默认
        当      CANBUS上HUD角度设置为0
        而且    CANBUS上信号持续1秒
        那么    HUD角度不改变
        
    @HUDSettings
    场景:	HUD角度设置为增加
        假如    HUD角度设置为默认
        当      CANBUS上HUD角度设置为1
        而且    CANBUS上信号持续1秒
        那么    HUD角度增加
        
    @HUDSettings
    场景:	HUD角度设置为减少
        假如    HUD角度设置为默认
        当      CANBUS上HUD角度设置为2
        而且    CANBUS上信号持续1秒
        那么    HUD角度减少
        
    @HUDSettings
    场景:	HUD角度设置为保留值
        当      CANBUS上有速度为3
        而且    CANBUS上信号持续1秒
        那么    HUD角度不改变
        
    @HUDSettings
    场景:	HUD角度设置失效，使用最后一次的有效值显示
        假如    HUD角度设置为默认
        当      CANBUS上HUD角度设置为0
        而且    CANBUS上信号持续1秒
        那么    HUD显示角度不改变
        
        当      CANBUS上信号断开2秒
        那么    HUD显示角度不改变

        当      CANBUS上HUD角度设置为1
        而且    CANBUS上信号持续1秒
        那么    HUD显示角度增加
