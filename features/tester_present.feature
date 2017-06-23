# Created by enrico at 22/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 诊断设备在线
  ============================================
  诊断设备在线

  @TesterPresent
  场景:    诊断设备请求成功
    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有诊断设备请求，参数ZeroSubFunction为0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断设备肯定响应，参数ZeroSubFunction为0x00

  @TesterPresent
  场景:    诊断设备请求，不支持子功能
    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有诊断设备请求，参数ZeroSubFunction为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断设备否定响应，参数NegativeResponseCode为不支持子功能

  @TesterPresent
  场景:    诊断设备请求，报文只有RequestServiceIdentifier
    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有诊断设备请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断设备否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @TesterPresent
  场景:    诊断设备请求，报文长度超长
    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有诊断设备请求，报文长度为1025个字节，参数ZeroSubFunction为0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断设备否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

