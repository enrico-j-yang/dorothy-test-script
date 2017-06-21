# Created by enrico at 21/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 例程控制
============================================
    例程控制

    @RoutineControl, @wip
    场景:	例程控制请求开始例程成功
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁1

        当      CANBUS上有例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制肯定响应，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineStatusrecord为？？

    @RoutineControl, @wip
    场景:	例程控制请求停止例程成功
        假如    HUD当前例程控制状态为已开始

        当      CANBUS上有例程控制请求，参数RoutineControlType为停止例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制肯定响应，参数RoutineControlType为停止例程，参数RoutineIdentifier为？？，参数RoutineStatusrecord为？？

    @RoutineControl, @wip
    场景:	例程控制请求请求例程结果成功
        假如    HUD当前例程控制状态为已结束

        当      CANBUS上有例程控制请求，参数RoutineControlType为停止例程，参数RoutineIdentifier为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制肯定响应，参数RoutineControlType为请求例程结果，参数RoutineIdentifier为？？，参数RoutineStatusrecord为？？

    @RoutineControl, @wip
    场景:	例程控制请求不支持子功能
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁1

        当      CANBUS上有例程控制请求，参数RoutineControlType为0xFF，参数RoutineIdentifier为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为不支持子功能

    @RoutineControl, @wip
    场景:	例程控制请求报文长度只有1个字节
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁1

        当      CANBUS上有例程控制请求，报文长度为1个字节
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @RoutineControl, @wip
    场景:	例程控制请求报文长度只有2个字节
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁1

        当      CANBUS上有例程控制请求，报文长度为2个字节，参数RoutineControlType为启动例程
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @RoutineControl, @wip
    场景:	例程控制请求报文长度只有3个字节
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁1

        当      CANBUS上有例程控制请求，报文长度为3个字节，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @RoutineControl, @wip
    场景:	例程控制请求条件不满足
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁1

        当      CANBUS上有例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为条件不满足

    @RoutineControl, @wip
    场景:	例程控制请求序列错误
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁1
        假如    HUD当前例程控制状态为已结束

        当      CANBUS上有例程控制请求，参数RoutineControlType为结束例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为请求序列错误

    @RoutineControl, @wip
    场景:	例程控制请求ECU 不支持被请求的例程标识
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁1

        当      CANBUS上有例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为请求数据超出范围

    @RoutineControl, @wip
    场景:	例程控制请求对于被请求例程标识符，用户选择的例程控制选项记录包含无效数据
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁1

        当      CANBUS上有例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为请求数据超出范围

    @RoutineControl, @wip
    场景:	例程控制请求安全访问拒绝
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为锁定

        当      CANBUS上有例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为安全访问拒绝

    @RoutineControl, @wip
    场景:	例程控制请求一般编程错误
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁1

        当      CANBUS上有例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为一般编程错误


