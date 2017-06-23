# Created by enrico at 19/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 读取DTC信息
  ============================================
  读取DTC信息数目，读取DTC信息列表和状态，控制DTC设置

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告所有ISO15031-6DTCFormat格式 DTC 数目成功
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告所有ISO14229-1DTCFormat格式 DTC 数目成功
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO14229-1DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x01，参数DTCCount为0x0001

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告单个 DTC 数目成功
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x01
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x01，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

  @ReadDTCInformation, @wip
  场景:    读取 DTC 信息 – 通过0x00状态掩码报告 DTC 数目成功
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x00，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001？？

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告 DTC 最大数目成功
    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    当      HUD上电路电压高于门槛值
    而且    HUD上的电路电压高于门槛值持续1秒

    当      HUD上TFT屏温度高于门槛值
    而且    HUD上的TFT屏高温持续1秒

    当      HUD上Combiner移动受阻
    而且    HUD上的Combiner移动受阻持续4秒

    当      HUD上Covert移动受阻
    而且    HUD上的Covert移动受阻持续4秒

    当      HUD上EMS 节点报文超时
    而且    HUD上的EMS 节点报文超时持续1秒

    当      HUD上FBCM 节点报文超时
    而且    HUD上的FBCM 节点报文超时持续2秒

    当      HUD上IC 节点报文超时
    而且    HUD上的IC 节点报文超时持续2秒

    当      HUD上DVD 节点报文超时
    而且    HUD上的DVD 节点报文超时持续2秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x09

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告1个DTC成功
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0xFF，参数DTCAndStatusRecord为0x91171604

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告多个DTC成功
    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    当      HUD上电路电压高于门槛值
    而且    HUD上的高压持续1秒

    当      HUD上TFT屏温度高于门槛值
    而且    HUD上的TFT屏高温持续1秒

    当      HUD上Combiner移动受阻
    而且    HUD上的Combiner移动受阻持续4秒

    当      HUD上Covert移动受阻
    而且    HUD上的Covert移动受阻持续4秒

    当      HUD上EMS 节点报文超时
    而且    HUD上的EMS 节点报文超时持续1秒

    当      HUD上FBCM 节点报文超时
    而且    HUD上的FBCM 节点报文超时持续2秒

    当      HUD上IC 节点报文超时
    而且    HUD上的IC 节点报文超时持续2秒

    当      HUD上DVD 节点报文超时
    而且    HUD上的DVD 节点报文超时持续2秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x09

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0xFF，参数DTCAndStatusRecord为0xC2558704C2548704C2538704C1468704911720049117190491171804911717040491171604

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 报告支持的 DTC 成功
    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    当      HUD上电路电压高于门槛值
    而且    HUD上的高压持续1秒

    当      HUD上TFT屏温度高于门槛值
    而且    HUD上的TFT屏高温持续1秒

    当      HUD上Combiner移动受阻
    而且    HUD上的Combiner移动受阻持续4秒

    当      HUD上Covert移动受阻
    而且    HUD上的Covert移动受阻持续4秒

    当      HUD上EMS 节点报文超时
    而且    HUD上的EMS 节点报文超时持续1秒

    当      HUD上FBCM 节点报文超时
    而且    HUD上的FBCM 节点报文超时持续2秒

    当      HUD上IC 节点报文超时
    而且    HUD上的IC 节点报文超时持续2秒

    当      HUD上DVD 节点报文超时
    而且    HUD上的DVD 节点报文超时持续2秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为报告支持的 DTC
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为报告支持的 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2558704C2548704C2538704C14687049117200491171904911718049117170491171604

  @ReadDTCInformation
  场景:    CANBUS总线关闭故障恢复
    当      HUD上CANBUS总线关闭
    而且    CANBUS总线关闭持续0.25秒

    当      HUD上CANBUS总线打开
    而且    CANBUS总线关闭持续0.05秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC0730004

    当      HUD上CANBUS总线打开
    而且    CANBUS总线关闭持续0.2秒

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC0730000

  @ReadDTCInformation
  场景:    EMS 节点报文超时故障恢复
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上EMS 节点报文超时
    而且    HUD上的EMS 节点报文超时持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC1468704

    当      HUD上EMS 节点报文恢复正常
    而且    HUD上EMS 节点报文持续1秒

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC1468700

  @ReadDTCInformation
  场景:    FBCM 节点报文超时故障恢复
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上FBCM 节点报文超时
    而且    HUD上的FBCM 节点报文超时持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2538704

    当      HUD上FBCM 节点报文恢复正常
    而且    HUD上FBCM 节点报文持续1秒

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2538700

  @ReadDTCInformation
  场景:    IC 节点报文超时故障恢复
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上IC 节点报文超时
    而且    HUD上的IC 节点报文超时持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2548704

    当      HUD上IC 节点报文恢复正常
    而且    HUD上IC 节点报文持续1秒

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2548700

  @ReadDTCInformation
  场景:    DVD 节点报文超时故障恢复
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上DVD 节点报文超时
    而且    HUD上的DVD 节点报文超时持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2558704

    当      HUD上DVD 节点报文恢复正常
    而且    HUD上DVD 节点报文持续1秒

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2558700

  @ReadDTCInformation
  场景:    低电压异常故障恢复
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171604

    当      HUD上电路电压恢复正常
    而且    HUD上的电路电压持续1秒

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171600

  @ReadDTCInformation
  场景:    高电压异常故障恢复
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压高于门槛值
    而且    HUD上的电路电压高于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171704

    当      HUD上电路电压恢复正常
    而且    HUD上的电路电压持续1秒

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171700

  @ReadDTCInformation
  场景:    TFT屏高温保护故障恢复
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上TFT屏温度高于门槛值
    而且    HUD上的TFT屏温度高于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171804

    当      HUD上TFT屏温度恢复正常
    而且    HUD上的TFT屏温度持续1秒

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171800

  @ReadDTCInformation
  场景:    Combiner移动受阻故障恢复
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上Combiner移动受阻
    而且    HUD上的Combiner移动受阻持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171904

    当      HUD上Combiner移动恢复正常
    而且    HUD上的Combiner移动持续1秒

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171900

  @ReadDTCInformation
  场景:    Covert移动受阻故障恢复
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上Covert移动受阻
    而且    HUD上的Covert移动受阻持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91172004

    当      HUD上Covert移动恢复正常
    而且    HUD上的Covert移动持续1秒

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91172000

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文只有请求名称
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文只有请求名称和子功能
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，报文长度为2个字节，参数Sub-Function为通过状态掩码报告DTC数目
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文只有请求名称和子功能
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，报文长度为2个字节，参数Sub-Function为通过状态掩码报告 DTC
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文长度超长
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，报文长度为1025个字节，参数Sub-Function为0xFF，参数DTCStatusMask为0xFF，其余字节填充0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @ReadDTCInformation
  场景:    读取 DTC 信息请求子功能不支持
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为0xFF，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为子功能不支持

  @ReadDTCInformation
  场景:    读取 DTC 信息请求子功能不支 持通过DTC码报告DTCSnapshot记录
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过DTC码报告DTCSnapshot记录，参数DTCMaskRecord为0xFFFFFF，参数DTCSnapshotRecordNumber0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为子功能不支持

  @ReadDTCInformation
  场景:    读取 DTC 信息请求子功能不支持 通过 DTC 码报告 DTC 扩展数据记录
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过DTC码报告DTC扩展数据记录，参数DTCMaskRecord为0xFFFFFF，参数DTCSnapshotRecordNumber0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为子功能不支持

  @ReadDTCInformation
  场景:    读取 DTC 信息请求子功能不支持 报告支持的 DTC
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为报告支持的DTC
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为子功能不支持

  @ControlDTCSetting
  场景:    控制DTC设置打开成功
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有控制DTC设置请求，参数DTCSettingType为打开
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置肯定响应，参数DTCSettingType为打开

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0xFF，参数DTCAndStatusRecord为0x91171604

  @ControlDTCSetting
  场景:    控制DTC设置关闭成功
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有控制DTC设置请求，参数DTCSettingType为关闭
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置肯定响应，参数DTCSettingType为关闭

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0xFF，参数DTCAndStatusRecord为0x91171600

  @ControlDTCSetting
  场景:    控制DTC设置，响应不支持子功能
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有控制DTC设置请求，参数DTCSettingType为0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置否定响应，参数NegativeResponseCode为不支持子功能

  @ControlDTCSetting
  场景:    控制DTC设置，报文只有RequestServiceIdentifier
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有控制DTC设置请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @ControlDTCSetting
  场景:    控制DTC设置，报文长度超长
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有控制DTC设置请求，报文长度为1025个字节，参数DTCSettingType为打开
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @ControlDTCSetting, @wip
  场景:    控制DTC设置，如果 ECU 处于正常模式临界状态而不能执行被请求的诊断故障码控制功能，响应条件不满足
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常
    假如    HUD处于正常模式临界状态？？

    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有控制DTC设置请求，参数DTCSettingType为打开
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置否定响应，参数NegativeResponseCode为条件不满足


