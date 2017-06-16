# -*- coding: utf-8 -*-
# language: zh-CN

功能: 诊断会话控制
============================================
    诊断会话控制

    @DiagnosticSessionControl
    场景:	从默认会话进入默认会话成功
        假如    HUD当前诊断会话模式为默认会话
        当      CANBUS上有诊断会话控制请求，参数为进入默认会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    @DiagnosticSessionControl
    场景:	从默认会话进入扩展诊断会话成功
        假如    HUD当前诊断会话模式为默认会话
        当      CANBUS上有诊断会话控制请求，参数为进入扩展诊断会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入扩展诊断会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    @DiagnosticSessionControl
    场景:	从扩展诊断会话进入扩展诊断会话成功
        假如    HUD当前诊断会话模式为扩展诊断会话
        当      CANBUS上有诊断会话控制请求，参数为进入扩展诊断会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入扩展诊断会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    @DiagnosticSessionControl
    场景:	从扩展诊断会话进入默认会话成功
        假如    HUD当前诊断会话模式为扩展诊断会话
        当      CANBUS上有诊断会话控制请求，参数为进入默认会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    @DiagnosticSessionControl
    场景:	从扩展诊断会话进入编程会话成功
        假如    HUD当前诊断会话模式为扩展诊断会话
        当      CANBUS上有诊断会话控制请求，参数为进入编程会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入编程会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    @DiagnosticSessionControl
    场景:	从编程会话进入编程会话成功
        假如    HUD当前诊断会话模式为编程会话
        当      CANBUS上有诊断会话控制请求，参数为进入编程会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入编程会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    @DiagnosticSessionControl
    场景:	从编程会话进入默认会话成功
        假如    HUD当前诊断会话模式为编程会话
        当      CANBUS上有诊断会话控制请求，参数为进入默认会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    @DiagnosticSessionControl
    场景:	从默认会话进入编程会话失败
        假如    HUD当前诊断会话模式为默认会话
        当      CANBUS上有诊断会话控制请求，参数为进入编程会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制否定响应，参数OriginalRequestServiceIdentifier为诊断会话控制，参数NegativeResponseCode为条件未满足

    @DiagnosticSessionControl
    场景:	从编程会话进入扩展诊断会话失败
        假如    HUD当前诊断会话模式为编程会话
        当      CANBUS上有诊断会话控制请求，参数为进入扩展诊断会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制否定响应，参数OriginalRequestServiceIdentifier为诊断会话控制，参数NegativeResponseCode为条件未满足

    @DiagnosticSessionControl
    场景:	诊断会话控制子功能参数不支持
        假如    HUD当前诊断会话模式为默认会话
        当      CANBUS上有诊断会话控制请求，参数为非法值
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制否定响应，参数OriginalRequestServiceIdentifier为诊断会话控制，参数NegativeResponseCode为子功能不支持

    @DiagnosticSessionControl
    场景:	诊断会话控制报文长度错误
        假如    HUD当前诊断会话模式为默认会话
        当      CANBUS上有诊断会话控制请求，报文长度为1个字节
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制否定响应，参数OriginalRequestServiceIdentifier为诊断会话控制，参数NegativeResponseCode为报文长度错误

    @DiagnosticSessionControl
    场景:	诊断会话控制请求超长
        假如    HUD当前诊断会话模式为默认会话
        当      CANBUS上有诊断会话控制请求，报文长度为1025个字节，参数为进入扩展诊断会话，其余字节填充0x00
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制否定响应，参数OriginalRequestServiceIdentifier为诊断会话控制，参数NegativeResponseCode为报文长度错误


