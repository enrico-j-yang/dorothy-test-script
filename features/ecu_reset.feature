# -*- coding: utf-8 -*-
# language: zh-CN

功能: 电控单元复位
============================================
    电控单元复位

    @ECUReset
    场景:	从默认会话硬件复位进入默认会话成功
        假如    HUD当前诊断会话模式为默认会话
        当      CANBUS上有ECU复位请求，参数为硬件复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为硬件复位

    @ECUReset
    场景:	从默认会话钥匙开关复位进入默认会话成功
        假如    HUD当前诊断会话模式为默认会话
        当      CANBUS上有ECU复位请求，参数为钥匙开关复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为钥匙开关复位

    @ECUReset
    场景:	从默认会话软件复位进入默认会话成功
        假如    HUD当前诊断会话模式为默认会话
        当      CANBUS上有ECU复位请求，参数为软件复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为软件复位

    @ECUReset
    场景:	从扩展诊断会话硬件复位进入默认会话成功
        假如    HUD当前诊断会话模式为扩展诊断会话
        当      CANBUS上有ECU复位请求，参数为硬件复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为硬件复位

    @ECUReset
    场景:	从扩展诊断会话钥匙开关复位进入默认会话成功
        假如    HUD当前诊断会话模式为扩展诊断会话
        当      CANBUS上有ECU复位请求，参数为钥匙开关复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为钥匙开关复位

    @ECUReset
    场景:	从扩展诊断会话软件复位进入默认会话成功
        假如    HUD当前诊断会话模式为扩展诊断会话
        当      CANBUS上有ECU复位请求，参数为软件复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为软件复位

    @ECUReset
    场景:	从编程会话硬件复位进入默认会话成功
        假如    HUD当前诊断会话模式为编程会话
        当      CANBUS上有ECU复位请求，参数为硬件复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为硬件复位

    @ECUReset
    场景:	从编程会话钥匙开关复位进入默认会话成功
        假如    HUD当前诊断会话模式为编程会话
        当      CANBUS上有ECU复位请求，参数为钥匙开关复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为钥匙开关复位

    @ECUReset
    场景:	从编程会话软件复位进入默认会话成功
        假如    HUD当前诊断会话模式为编程会话
        当      CANBUS上有ECU复位请求，参数为软件复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为软件复位

    @ECUReset
    场景:	ECU复位请求子功能参数不支持
        假如    HUD当前诊断会话模式为扩展诊断会话
        当      CANBUS上有ECU复位请求，参数为非法值
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位否定响应，参数NegativeResponseCode为子功能不支持

    @ECUReset
    场景:	ECU复位请求报文长度错误
        假如    HUD当前诊断会话模式为扩展诊断会话
        当      CANBUS上有ECU复位请求，报文长度为1个字节
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位否定响应，参数NegativeResponseCode为报文长度错误

    @ECUReset
    场景:	ECU复位请求报文超长
        假如    HUD当前诊断会话模式为扩展诊断会话
        当      CANBUS上有ECU复位请求，报文长度为1025个字节，参数为进入扩展诊断会话，其余字节填充0x00
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位否定响应，参数NegativeResponseCode为报文长度错误

    @ECUReset, @wip
    场景:	ECU复位请求条件未满足
        假如    HUD当前诊断会话模式为扩展诊断会话
        假如    HUD当前??
        当      CANBUS上有ECU复位请求，参数为??
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位否定响应，参数NegativeResponseCode为条件未满足

    @ECUReset, @wip
    场景:	ECU复位请求安全访问拒绝
        假如    HUD当前诊断会话模式为扩展诊断会话
        假如    HUD当前不在解锁状态
        当      CANBUS上有受保护的ECU复位请求，参数为??
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位否定响应，参数NegativeResponseCode为安全访问拒绝


