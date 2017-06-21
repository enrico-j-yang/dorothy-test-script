# Created by enrico at 19/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 读取DTC信息
  ============================================
  读取DTC信息数目，读取DTC信息列表和状态

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告所有ISO15031-6DTCFormat格式 DTC 数目成功
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告所有ISO14229-1DTCFormat格式 DTC 数目成功
    假如    HUD上有ISO14229-1DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x01，参数DTCCount为0x0001

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告单个 DTC 数目成功
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x01
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x01，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

  @ReadDTCInformation, @wip
  场景:    读取 DTC 信息 – 通过0x00状态掩码报告 DTC 数目成功
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x00，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001？？

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告 DTC 最大数目成功
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为65535
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0xFFFF

  @ReadDTCInformation, @wip
  场景:    读取 DTC 信息 – 通过状态掩码报告 DTC成功
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0xFF，参数DTCAndStatusRecord为??

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文只有请求名称
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文只有请求名称和子功能
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，报文长度为2个字节，参数Sub-Function为通过状态掩码报告DTC数目
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文只有请求名称和子功能
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，报文长度为2个字节，参数Sub-Function为通过状态掩码报告 DTC
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @ReadDTCInformation
  场景:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文长度超长
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，报文长度为1025个字节，参数Sub-Function为0xFF，参数DTCStatusMask为0xFF，其余字节填充0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @ReadDTCInformation
  场景:    读取 DTC 信息请求子功能不支持
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为0xFF，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为子功能不支持

  @ReadDTCInformation
  场景:    读取 DTC 信息请求子功能不支 持通过DTC码报告DTCSnapshot记录
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过DTC码报告DTCSnapshot记录，参数DTCMaskRecord为0xFFFFFF，参数DTCSnapshotRecordNumber0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为子功能不支持

  @ReadDTCInformation
  场景:    读取 DTC 信息请求子功能不支持 通过 DTC 码报告 DTC 扩展数据记录
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为通过DTC码报告DTC扩展数据记录，参数DTCMaskRecord为0xFFFFFF，参数DTCSnapshotRecordNumber0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为子功能不支持

  @ReadDTCInformation
  场景:    读取 DTC 信息请求子功能不支持 报告支持的 DTC
    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    假如    HUD上DTC信息的数目为1
    当      CANBUS上有读取DTC信息请求，参数Sub-Function为报告支持的DTC
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为子功能不支持


