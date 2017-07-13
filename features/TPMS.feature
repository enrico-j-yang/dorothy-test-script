# -*- coding: utf-8 -*-
# language: zh-CN

功能: 胎压
  ============================================
  胎压

  @TPMS
  场景:    胎压报警状态正常
    当      CANBUS上胎压报警状态为正常
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

    而且    CANBUS上信号持续3秒
    那么    HUD不显示胎压报警

  @TPMS
  场景:    胎压报警状态系统故障
    当      CANBUS上胎压报警状态为正常
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

    而且    CANBUS上信号持续3秒
    那么    HUD不显示胎压报警

    当      CANBUS上胎压报警状态为系统故障
    而且    CANBUS上信号持续3秒
    那么    HUD显示胎压报警

  @TPMS
  场景:    胎压报警状态系统自检
    当      CANBUS上胎压报警状态为正常
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

    而且    CANBUS上信号持续3秒
    那么    HUD不显示胎压报警

    当      CANBUS上胎压报警状态为系统自检
    而且    CANBUS上信号持续3秒
    那么    HUD不显示胎压报警

  @TPMS
  场景:    胎压报警状态为预留
    当      CANBUS上胎压报警状态为正常
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

    而且    CANBUS上信号持续3秒
    那么    HUD不显示胎压报警

    当      CANBUS上胎压报警状态为预留
    而且    CANBUS上信号持续3秒
    那么    HUD不显示胎压报警

  @TPMS
  场景:    胎压报警状态失效，使用最后一次的有效值显示
    当      CANBUS上胎压报警状态为正常
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

    而且    CANBUS上信号持续3秒
    那么    HUD不显示胎压报警

    当      CANBUS上胎压报警状态为系统故障
    而且    CANBUS上信号持续3秒
    那么    HUD显示胎压报警

    当      CANBUS上信号断开3秒
    那么    HUD显示胎压报警
