# -*- coding: utf-8 -*-
# language: zh-CN

功能: HUD设置
  ============================================
  HUD设置

  @HUDSettings
  场景:   HUD显示模式为行驶信息+导航信息+车身报警信息
    当      CANBUS上显示模式为默认

    当      CANBUS上有速度为60km/h
    而且    CANBUS上信号持续1秒
    那么    HUD显示速度为60km/h

    当      CANBUS上当前道路名称数据为映日路
    而且    CANBUS上信号持续0.2秒
    那么    HUD显示当前道路名称为映日路

    当      CANBUS上目的地距离值为2500km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km
    当      CANBUS上到下一个路口的进度值为50%
    当      CANBUS上指北针角度为0

    假如    HUD不显示高水温报警
    当      CANBUS上有引擎冷却剂温度为110度
    而且    CANBUS上引擎冷却剂温度值状态为合法

    当      CANBUS上胎压报警状态为系统故障
    而且    CANBUS上轮位为右后轮胎
    而且    CANBUS上单个胎压信号为正常
    而且    CANBUS上单个轮胎漏气为正常
    而且    CANBUS上单个轮胎学习状态为未学习
    而且    CANBUS上单个胎压状态为正常
    而且    CANBUS上单个轮胎温度状态为正常
    而且    CANBUS上单个轮胎压力值为350
    而且    CANBUS上单个轮胎温度值为255
    而且    CANBUS上单个胎压监测模块电池电量为非法
    而且    CANBUS上单个轮胎电池电量状态为正常
    假如    HUD不显示低燃油报警
    当      CANBUS上有剩余油量为8升
    而且    CANBUS上提示主驾驶安全带示系灯为关闭
    而且    CANBUS上提示副驾驶安全带示系灯为关闭

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为2500km
    而且    HUD显示到达目的地剩余时间为88h33m
    而且    HUD显示下一个路口的距离为2km
    那么    HUD显示到下一个路口的进度值为50%
    那么    HUD显示指北针方向为北
    那么    HUD显示高水温报警
    那么    HUD显示胎压报警
    那么    HUD显示低燃油报警

  @HUDSettings
  场景:   HUD显示模式为行驶信息+车身报警信息
    当      CANBUS上显示模式为模式2
    而且    CANBUS上信号持续1秒

    当      CANBUS上有速度为60km/h
    而且    CANBUS上信号持续1秒
    那么    HUD显示速度为60km/h

    当      CANBUS上当前道路名称数据为映日路
    而且    CANBUS上信号持续0.2秒
    那么    HUD不显示当前道路名称

    当      CANBUS上目的地距离值为2500km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km
    当      CANBUS上到下一个路口的进度值为50%
    当      CANBUS上指北针角度为0

    假如    HUD不显示高水温报警
    当      CANBUS上有引擎冷却剂温度为110度
    而且    CANBUS上引擎冷却剂温度值状态为合法
    当      CANBUS上胎压报警状态为系统故障
    而且    CANBUS上轮位为右后轮胎
    而且    CANBUS上单个胎压信号为正常
    而且    CANBUS上单个轮胎漏气为正常
    而且    CANBUS上单个轮胎学习状态为未学习
    而且    CANBUS上单个胎压状态为正常
    而且    CANBUS上单个轮胎温度状态为正常
    而且    CANBUS上单个轮胎压力值为350
    而且    CANBUS上单个轮胎温度值为255
    而且    CANBUS上单个胎压监测模块电池电量为非法
    而且    CANBUS上单个轮胎电池电量状态为正常
    假如    HUD不显示低燃油报警
    当      CANBUS上有剩余油量为8升
    而且    CANBUS上提示主驾驶安全带示系灯为关闭
    而且    CANBUS上提示副驾驶安全带示系灯为关闭

    而且    CANBUS上信号持续3秒

    那么    HUD不显示目的地距离
    而且    HUD不显示到达目的地剩余时间
    而且    HUD不显示下一个路口的距离
    那么    HUD不显示到下一个路口的进度
    那么    HUD不显示指北针方向
    那么    HUD显示高水温报警
    那么    HUD显示胎压报警
    那么    HUD显示低燃油报警

  @HUDSettings
  场景:   HUD显示模式为保留值
    假如    HUD的显示模式为默认模式
    当      CANBUS上显示模式为保留值
    而且    CANBUS上信号持续1秒

    当      CANBUS上有速度为60km/h
    而且    CANBUS上信号持续1秒
    那么    HUD显示速度为60km/h

    当      CANBUS上当前道路名称数据为映日路
    而且    CANBUS上信号持续0.2秒
    那么    HUD显示当前道路名称为映日路

    当      CANBUS上目的地距离值为2500km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km
    当      CANBUS上到下一个路口的进度值为50%
    当      CANBUS上指北针角度为0

    假如    HUD不显示高水温报警
    当      CANBUS上有引擎冷却剂温度为110度
    而且    CANBUS上引擎冷却剂温度值状态为合法
    当      CANBUS上胎压报警状态为系统故障
    而且    CANBUS上轮位为右后轮胎
    而且    CANBUS上单个胎压信号为正常
    而且    CANBUS上单个轮胎漏气为正常
    而且    CANBUS上单个轮胎学习状态为未学习
    而且    CANBUS上单个胎压状态为正常
    而且    CANBUS上单个轮胎温度状态为正常
    而且    CANBUS上单个轮胎压力值为350
    而且    CANBUS上单个轮胎温度值为255
    而且    CANBUS上单个胎压监测模块电池电量为非法
    而且    CANBUS上单个轮胎电池电量状态为正常
    假如    HUD不显示低燃油报警
    当      CANBUS上有剩余油量为8升
    而且    CANBUS上提示主驾驶安全带示系灯为关闭
    而且    CANBUS上提示副驾驶安全带示系灯为关闭

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为2500km
    而且    HUD显示到达目的地剩余时间为88h33m
    而且    HUD显示下一个路口的距离为2km
    那么    HUD显示到下一个路口的进度值为50%
    那么    HUD显示指北针方向为北
    那么    HUD显示高水温报警
    那么    HUD显示胎压报警
    那么    HUD显示低燃油报警

  @HUDSettings
  场景:   HUD显示模式失效，使用最后一次的有效值显示
    当      CANBUS上显示模式为模式2
    而且    CANBUS上信号持续1秒

    当      CANBUS上有速度为60km/h
    而且    CANBUS上信号持续1秒
    那么    HUD显示速度为60km/h

    当      CANBUS上当前道路名称数据为映日路
    而且    CANBUS上信号持续0.2秒
    那么    HUD不显示当前道路名称

    当      CANBUS上目的地距离值为2500km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km
    当      CANBUS上到下一个路口的进度值为50%
    当      CANBUS上指北针角度为0

    假如    HUD不显示高水温报警
    当      CANBUS上有引擎冷却剂温度为110度
    而且    CANBUS上引擎冷却剂温度值状态为合法
    当      CANBUS上胎压报警状态为系统故障
    而且    CANBUS上轮位为右后轮胎
    而且    CANBUS上单个胎压信号为正常
    而且    CANBUS上单个轮胎漏气为正常
    而且    CANBUS上单个轮胎学习状态为未学习
    而且    CANBUS上单个胎压状态为正常
    而且    CANBUS上单个轮胎温度状态为正常
    而且    CANBUS上单个轮胎压力值为350
    而且    CANBUS上单个轮胎温度值为255
    而且    CANBUS上单个胎压监测模块电池电量为非法
    而且    CANBUS上单个轮胎电池电量状态为正常
    假如    HUD不显示低燃油报警
    当      CANBUS上有剩余油量为8升
    而且    CANBUS上提示主驾驶安全带示系灯为关闭
    而且    CANBUS上提示副驾驶安全带示系灯为关闭

    而且    CANBUS上信号持续3秒

    那么    HUD不显示目的地距离
    而且    HUD不显示到达目的地剩余时间
    而且    HUD不显示下一个路口的距离
    那么    HUD不显示到下一个路口的进度
    那么    HUD不显示指北针方向
    那么    HUD显示高水温报警
    那么    HUD显示胎压报警
    那么    HUD显示低燃油报警

    当      CANBUS上信号断开2秒
    那么    HUD显示速度为60km/h
    那么    HUD显示高水温报警
    那么    HUD显示胎压报警
    那么    HUD显示低燃油报警

  @HUDSettings
  场景:   HUD亮度设置为默认
    假如    HUD显示亮度为默认
    当      CANBUS上HUD亮度设置为默认
    而且    CANBUS上信号持续1秒
    那么    HUD显示亮度不改变

  @HUDSettings
  场景:   HUD亮度设置为增强
    假如    HUD显示亮度为默认
    当      CANBUS上HUD亮度设置为增强
    而且    CANBUS上信号持续1秒
    那么    HUD显示亮度增强

  @HUDSettings
  场景:   HUD亮度设置为减弱
    假如    HUD显示亮度为默认
    当      CANBUS上HUD亮度设置为减弱
    而且    CANBUS上信号持续1秒
    那么    HUD显示亮度减弱

  @HUDSettings
  场景:   HUD亮度设置为保留值
    假如    HUD显示亮度为默认
    当      CANBUS上HUD亮度设置为保留值
    而且    CANBUS上信号持续1秒
    那么    HUD显示亮度不改变

  @HUDSettings
  场景:   HUD亮度设置失效，使用最后一次的有效值显示
    假如    HUD显示亮度为默认
    当      CANBUS上HUD亮度设置为默认
    而且    CANBUS上信号持续1秒
    那么    HUD显示亮度不改变

    当      CANBUS上信号断开2秒
    那么    HUD显示亮度不改变

    当      CANBUS上HUD亮度设置为增强
    而且    CANBUS上信号持续1秒
    那么    HUD显示亮度增强

  @HUDSettings
  场景:   HUD角度设置为默认
    假如    HUD角度设置为默认
    当      CANBUS上HUD角度设置为默认
    而且    CANBUS上信号持续1秒
    那么    HUD显示角度不改变

  @HUDSettings
  场景:   HUD角度设置为增加
    假如    HUD角度设置为默认
    当      CANBUS上HUD角度设置为增加
    而且    CANBUS上信号持续1秒
    那么    HUD显示角度增加

  @HUDSettings
  场景:   HUD角度设置为减少
    假如    HUD角度设置为默认
    当      CANBUS上HUD角度设置为减少
    而且    CANBUS上信号持续1秒
    那么    HUD显示角度减少

  @HUDSettings
  场景:   HUD角度设置为保留值
    假如    HUD角度设置为默认
    当      CANBUS上HUD角度设置为保留值
    而且    CANBUS上信号持续1秒
    那么    HUD显示角度不改变

  @HUDSettings
  场景:   HUD角度设置失效，使用最后一次的有效值显示
    假如    HUD角度设置为默认
    当      CANBUS上HUD角度设置为默认
    而且    CANBUS上信号持续1秒
    那么    HUD显示角度不改变

    当      CANBUS上信号断开2秒
    那么    HUD显示角度不改变

    当      CANBUS上HUD角度设置为增加
    而且    CANBUS上信号持续1秒
    那么    HUD显示角度增加
