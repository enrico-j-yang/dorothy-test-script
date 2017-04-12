# -*- coding: utf-8 -*-
# language: zh-CN

功能: 电子眼
============================================
    电子眼
        
    @CamSpeedLimit
    场景:	显示电子眼限速
        当      CANBUS上电子眼限速值为60km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼限速图标，限速60km/h
        
    @CamSpeedLimit
    场景:	电子眼限速以10取整
        当      CANBUS上电子眼限速值为65km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼限速图标，限速60km/h
        
    @CamSpeedLimit
    场景:	电子眼限速为最小值
        当      CANBUS上电子眼限速值为20km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼限速图标，限速20km/h
        
    @CamSpeedLimit
    场景:	电子眼限速为最大值
        当      CANBUS上电子眼限速值为120km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼限速图标，限速120km/h
        
    @CamSpeedLimit
    场景:	车速大于电子眼限速
        当      CANBUS上有速度为50km/h
        而且    CANBUS上信号持续1秒
        那么    HUD显示速度为50km/h
        
        当      CANBUS上电子眼限速值为60km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼限速图标，限速60km/h
        
        当      CANBUS上速度在3秒内增加到70km/h
        那么    HUD显示速度在20秒内从50km/h增加到70km/h
        而且    CANBUS上信号持续3秒
        那么    HUD显示速度为70km/h
        而且    HUD显示电子眼限速图标以1Hz频率闪烁
        
    @CamSpeedLimit
    场景:	车速小于等于电子眼限速
        当      CANBUS上有速度为70km/h
        而且    CANBUS上电子眼限速值为60km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        
        那么    HUD显示速度为70km/h
        而且    HUD显示电子眼限速图标，限速60km/h
        而且    HUD显示电子眼限速图标以1Hz频率闪烁
        
        当      CANBUS上速度在3秒内下降到60km/h
        那么    HUD显示速度在20秒内从70km/h增加到60km/h
        
        而且    CANBUS上信号持续3秒
        
        那么    HUD显示速度为60km/h
        而且    HUD显示电子眼限速图标不闪烁
        
        当      CANBUS上速度在3秒内下降到50km/h
        那么    HUD显示速度在20秒内从60km/h增加到50km/h
        
        而且    CANBUS上信号持续3秒
        
        那么    HUD显示速度为50km/h
        而且    HUD显示电子眼限速图标不闪烁
        
    @CamSpeedLimit
    场景:	电子眼限速为非法最小值0
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD不显示电子眼限速图标
        
    @CamSpeedLimit
    场景:	电子眼限速为非法最大值255
        当      CANBUS上电子眼限速值为255km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD不显示电子眼限速图标
        
    @CamType
    场景:	显示电子眼红绿灯图标
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为红绿灯
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼红绿灯图标
        而且    HUD显示电子眼距离为500米
        
    @CamType
    场景:	显示电子眼违章拍照图标
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼违章拍照图标
        而且    HUD显示电子眼距离为500米
        
    @CamType
    场景:	显示电子眼无人看守铁路道口图标
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为无人看守铁路道口
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼无人看守铁路道口图标
        而且    HUD显示电子眼距离为500米
        
    @CamType
    场景:	显示电子眼事故易发路段图标
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为事故易发路段
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼事故易发路段图标
        而且    HUD显示电子眼距离为500米
        
    @CamType
    场景:	显示电子眼下陡坡图标
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为下陡坡
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼下陡坡图标
        而且    HUD显示电子眼距离为500米
        
    @CamType
    场景:	显示电子眼学校路段图标
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为学校路段
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼学校路段图标
        而且    HUD显示电子眼距离为500米
        
    @CamType
    场景:	显示电子眼连续弯路图标
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为连续弯路
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼连续弯路图标
        而且    HUD显示电子眼距离为500米
        
    @CamType
    场景:	显示电子眼傍山险路图标
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为傍山险路
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼傍山险路图标
        而且    HUD显示电子眼距离为500米
        
    @CamType
    场景:	显示电子眼注意危险图标
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为注意危险
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼注意危险图标
        而且    HUD显示电子眼距离为500米
        
    @CamType
    场景:	显示电子眼类型为保留值
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为保留值
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD不显示电子眼信息
        
    @CamType
    场景:	不显示电子眼距离
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为0米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼违章拍照图标
        
    @CamType
    场景:	电子眼距离超过1公里
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为2048米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼违章拍照图标
        而且    HUD显示电子眼距离为1000米
        
    @CamType
    场景:	电子眼距离为非法最大值
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为4095米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼违章拍照图标
        而且    HUD显示电子眼距离为1000米
        
    @CamType
    场景:	电子眼及电子眼距离提示失效，使用最后一次的有效值显示
        当      CANBUS上电子眼限速值为0km/h
        而且    CANBUS上电子眼类型为违章拍照
        而且    CANBUS上电子眼距离为500米
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示电子眼违章拍照图标
        而且    HUD显示电子眼距离为500米
    
        当      CANBUS上信号断开3秒
        那么    HUD显示电子眼违章拍照图标
        而且    HUD显示电子眼距离为500米