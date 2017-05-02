# -*- coding: utf-8 -*-
# language: zh-CN

功能: 当前道路名称显示
============================================
    当前道路名称显示
        
    @CurrentRoadName
    场景:	当前道路名称数据为一帧
        当      CANBUS上当前道路名称数据首帧为映日路
        
        那么    HUD显示当前道路名称为映日路
        
    @CurrentRoadName
    场景:	当前道路名称数据为两帧，无连续帧，路口名称不滚动
        当      CANBUS上当前道路名称数据首帧为黄埔大
        而且    CANBUS上当前道路名称数据第2帧为结束帧为道西
        
        那么    HUD显示当前道路名称为黄埔大道西
        
    @CurrentRoadName
    场景:	当前道路名称数据为三帧，有连续帧，路口名称不滚动
        当      CANBUS上当前道路名称数据首帧为沈海高
        而且    CANBUS上当前道路名称数据第2帧连续帧为速广州
        而且    CANBUS上当前道路名称数据第3帧结束帧为支线
        
        那么    HUD显示当前道路名称为沈海高速广州支线
        
    @CurrentRoadName
    场景:	当前道路名称数据为三帧，有连续帧，路口名称滚动
        当      CANBUS上当前道路名称数据首帧为呼和浩
        而且    CANBUS上当前道路名称数据第2帧连续帧为特西二
        而且    CANBUS上当前道路名称数据第3帧连续帧为环快速
        而且    CANBUS上当前道路名称数据第4帧结束帧为路
    
        那么    HUD滚动显示当前道路名称为呼和浩特西二环快速路
        
    @CurrentRoadName
    场景:	当前道路名称数据为十帧，有连续帧，二十九个字路口名称滚动
        当      CANBUS上当前道路名称数据首帧为一二三
        而且    CANBUS上当前道路名称数据第2帧连续帧为四五六
        而且    CANBUS上当前道路名称数据第3帧连续帧为七八九
        而且    CANBUS上当前道路名称数据第4帧连续帧为十壹贰
        而且    CANBUS上当前道路名称数据第5帧连续帧为叁肆伍
        而且    CANBUS上当前道路名称数据第6帧连续帧为陆柒捌
        而且    CANBUS上当前道路名称数据第7帧连续帧为玖拾甲
        而且    CANBUS上当前道路名称数据第8帧连续帧为乙丙丁
        而且    CANBUS上当前道路名称数据第9帧连续帧为戊己庚
        而且    CANBUS上当前道路名称数据第10帧结束帧为辛壬0xFFFF
    
        那么    HUD显示当前道路名称为一二三四五六七八九十壹贰叁肆伍陆柒捌玖拾甲乙丙丁戊己庚辛壬
        
    @CurrentRoadName
    场景:	当前道路名称数据为单帧，清除当前道路名称
        假如    HUD显示当前道路名称为映日路
        当      CANBUS上当前道路名称数据单帧
        
        那么    HUD不显示当前道路名称
        
    @CurrentRoadName
    场景:	当前道路名称数据发送过程中被其它事件中断，重新发送
        当      CANBUS上当前道路名称数据首帧为呼和浩
        而且    CANBUS上当前道路名称数据第2帧连续帧为特西二

        当      CANBUS上有速度为60km/h
        而且    CANBUS上信号持续0.1秒
        那么    HUD显示速度为60km/h
        
        当      CANBUS上当前道路名称数据首帧为呼和浩
        而且    CANBUS上当前道路名称数据第2帧连续帧为特西二
        而且    CANBUS上当前道路名称数据第3帧连续帧为环快速
        而且    CANBUS上当前道路名称数据第4帧结束帧为路
    
        那么    HUD滚动显示当前道路名称为呼和浩特西二环快速路
        
    @CurrentRoadName
    场景:	当前道路名称数据连续帧序号不连续
        当      CANBUS上当前道路名称数据首帧为呼和浩
        而且    CANBUS上当前道路名称数据第2帧连续帧为特西二
        而且    CANBUS上当前道路名称数据第4帧连续帧为环快速
        而且    CANBUS上当前道路名称数据第5帧结束帧为路
    
        那么    HUD不显示当前道路名称
        
    @CurrentRoadName
    场景:	当前道路名称数据为英文与中文混合名称
        当      CANBUS上当前道路名称数据首帧为沈海高
        而且    CANBUS上当前道路名称数据第2帧连续帧为速广州
        而且    CANBUS上当前道路名称数据第3帧结束帧为支线A
        
        那么    HUD显示当前道路名称为沈海高速广州支线A
        
    @CurrentRoadName
    场景:	当前道路名称数据为非法值
        当      CANBUS上当前道路名称数据0xFF
    
        那么    HUD不显示当前道路名称
        
    @CurrentRoadName
    场景:	当前道路名称数据失效，使用最后一次的有效值显示
        当      CANBUS上当前道路名称数据首帧为沈海高
        而且    CANBUS上当前道路名称数据第2帧连续帧为速广州
        而且    CANBUS上当前道路名称数据第3帧结束帧为支线
        
        那么    HUD显示当前道路名称为沈海高速广州支线
        
        当      CANBUS上信号断开2秒
        那么    HUD显示当前道路名称为沈海高速广州支线
    
    @CurrentRoadName
        当      CANBUS上当前道路名称数据首帧为沈海高
        而且    CANBUS上当前道路名称数据第2帧连续帧为速广州
        而且    CANBUS上当前道路名称数据第3帧结束帧为支线
        
        那么    HUD显示当前道路名称为沈海高速广州支线
        
        而且    CANBUS上信号持续3秒
        那么    HUD显示当前道路名称为沈海高速广州支线
        
        当      CANBUS上信号断开3秒
        那么    HUD不显示当前道路名称
        