# Created by enrico at 16/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 清除诊断信息
  ============================================
  清除诊断信息

  @ClearDiagnosticInformation, @wip
  场景:    清除排放相关系统诊断信息失败
    假如    HUD当前诊断信息为??
    当      CANBUS上有清除诊断信息请求，参数GroupOfDTC为排放相关系统
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为条件未满足

  @ClearDiagnosticInformation, @wip
  场景:    清除动力组诊断信息失败
    假如    HUD当前诊断信息为??
    当      CANBUS上有清除诊断信息请求，参数GroupOfDTC为动力组
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为条件未满足

  @ClearDiagnosticInformation, @wip
  场景:    清除底盘组诊断信息失败
    假如    HUD当前诊断信息为??
    当      CANBUS上有清除诊断信息请求，参数GroupOfDTC为底盘组
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为条件未满足

  @ClearDiagnosticInformation, @wip
  场景:    清除车身组诊断信息成功
    假如    HUD当前诊断信息为??
    当      CANBUS上有清除诊断信息请求，参数GroupOfDTC为车身组
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息肯定响应

  @ClearDiagnosticInformation, @wip
  场景:    清除网络通信组诊断信息失败
    假如    HUD当前诊断信息为??
    当      CANBUS上有清除诊断信息请求，参数GroupOfDTC为网络通信组
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为条件未满足

  @ClearDiagnosticInformation, @wip
  场景:    清除所有组诊断信息成功
    假如    HUD当前诊断信息为??
    当      CANBUS上有清除诊断信息请求，参数GroupOfDTC为所有组
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息肯定响应

  @ClearDiagnosticInformation, @wip
  场景:    清除所有组诊断信息请求报文长度错误
    假如    HUD当前诊断信息为??
    当      CANBUS上有清除诊断信息请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为报文长度错误

  @ClearDiagnosticInformation, @wip
  场景:    清除所有组诊断信息请求报文超长
    假如    HUD当前诊断信息为??
    当      CANBUS上有清除诊断信息请求，报文长度为1025个字节，参数GroupOfDTC为所有组，其余字节填充0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为报文长度错误

  @ClearDiagnosticInformation, @wip
  场景:    清除所有组诊断信息请求请求超出范围
    假如    HUD当前诊断信息为??
    当      CANBUS上有清除诊断信息请求，参数GroupOfDTC为非法值0xE00000
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为请求超出范围