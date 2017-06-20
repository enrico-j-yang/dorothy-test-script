# Created by enrico at 20/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 通信控制
============================================
    通信控制

    @CommunicationControl
    场景:	通信控制常规应用报文使能接收和发送请求成功
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为使能接收和发送，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收和发送

    @CommunicationControl
    场景:	通信控制常规应用报文使能接收且禁止发送请求成功
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为使能接收且禁止发送，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收且禁止发送

    @CommunicationControl
    场景:	通信控制常规应用报文禁止接收且使能发送请求成功
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为禁止接收且使能发送，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收且使能发送

    @CommunicationControl
    场景:	通信控制常规应用报文禁止接收和发送请求成功
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为禁止接收和发送，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收和发送

    @CommunicationControl
    场景:	通信控制网络管理报文使能接收且禁止发送请求成功
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为使能接收和发送，参数CommunicationType为网络管理报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收和发送

    @CommunicationControl
    场景:	通信控制常规应用报文和网络管理报文使能接收且禁止发送请求成功
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为使能接收和发送，参数CommunicationType为常规应用报文和网络管理报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收和发送

    @CommunicationControl
    场景:	通信控制常规应用报文使能接收和发送请求不支持子功能
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为0xFF，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为不支持子功能

    @CommunicationControl
    场景:	通信控制常规应用报文使能接收和发送请求报文长度只有1个字节
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，报文长度为1个字节
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为长度错误或者格式非法

    @CommunicationControl
    场景:	通信控制常规应用报文使能接收和发送请求报文长度只有2个字节
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，报文长度为1个字节，参数Sub-Function为使能接收和发送
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为长度错误或者格式非法

    @CommunicationControl
    场景:	通信控制常规应用报文使能接收和发送请求报文超长
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，报文长度为1025个字节，报文长度为1个字节，参数Sub-Function为使能接收和发送
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为长度错误或者格式非法

    @CommunicationControl
    场景:	通信控制常规应用报文使能接收和发送请求条件未满足
        假如    CANBUS上速度为50km/h
        而且    CANBUS上有引擎转速为1000
        当      CANBUS上有通信控制请求，参数Sub-Function为使能接收和发送，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为条件未满足

    @CommunicationControl
    场景:	通信控制常规应用报文使能接收和发送请求超出范围
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为使能接收和发送，参数CommunicationType为0xFF
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为请求超出范围

    @CommunicationControl
    场景:	从通信控制禁止接收和发送，切换到使能接收和发送请求成功
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为禁止接收和发送，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收和发送

        当      CANBUS上有通信控制请求，参数Sub-Function为使能接收和发送，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收和发送

    @CommunicationControl, @wip
    场景:	从通信控制禁止接收和发送，硬件复位到使能接收和发送请求成功
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为禁止接收和发送，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收和发送

        当      CANBUS上有ECU复位请求，参数为硬件复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为硬件复位
        而且    如何判断恢复到使能接收和发送状态??

    @CommunicationControl, @wip
    场景:	从通信控制禁止接收和发送，软件复位到使能接收和发送请求成功
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为禁止接收和发送，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收和发送

        当      CANBUS上有ECU复位请求，参数为软件复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为软件复位
        而且    如何判断恢复到使能接收和发送状态??

    @CommunicationControl, @wip
    场景:	从扩展诊断会话，通信控制禁止接收和发送，进入默认会话，使能接收和发送请求成功
        假如    HUD当前诊断会话模式为扩展诊断会话
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为禁止接收和发送，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收和发送

        当      CANBUS上有诊断会话控制请求，参数为进入默认会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，参数P2Server3为0x0000，参数P2Server4为0x0000
        而且    如何判断恢复到使能接收和发送状态??

    @CommunicationControl, @wip
    场景:	从编程会话，通信控制禁止接收和发送，进入默认会话，使能接收和发送请求成功
        假如    HUD当前诊断会话模式为编程会话
        假如    CANBUS上速度为0km/h
        而且    CANBUS上有引擎转速为0
        当      CANBUS上有通信控制请求，参数Sub-Function为禁止接收和发送，参数CommunicationType为常规应用报文
        而且    CANBUS上信号发送一次

        那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收和发送

        当      CANBUS上有诊断会话控制请求，参数为进入默认会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，参数P2Server3为0x0000，参数P2Server4为0x0000
        而且    如何判断恢复到使能接收和发送状态??


