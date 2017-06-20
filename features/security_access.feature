# Created by enrico at 19/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 安全访问
============================================
    安全访问请求种子，安全访问发送密钥

    @SecurityAccess
    场景:	安全访问请求级别1种子成功
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为安全访问请求级别1种子，参数SecuritySeed为有效值

    @SecurityAccess
    场景:	安全访问请求级别2种子成功
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别2种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为安全访问请求级别2种子，参数SecuritySeed为有效值

    @SecurityAccess
    场景:	安全访问请求级别1密钥成功
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

    @SecurityAccess
    场景:	安全访问请求级别2密钥成功
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别2密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别2密钥

    @SecurityAccess
    场景:	安全访问请求级别1种子已解锁
        假如    HUD当前安全访问状态为解锁1
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为0x00000000

    @SecurityAccess
    场景:	安全访问请求级别2种子已解锁
        假如    HUD当前安全访问状态为解锁2
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别2种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别2种子，参数SecuritySeed为0x00000000

    @SecurityAccess
    场景:	安全访问请求不支持子功能
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，参数SecurityAccessType为0xFF
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为不支持子功能

    @SecurityAccess
    场景:	安全访问请求报文长度错误
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，报文长度为1个字节
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @SecurityAccess
    场景:	安全访问请求级别2种子请求报文长度超长
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，报文长度为1025个字节，参数SecurityAccessType为请求级别2种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @SecurityAccess, @wip
    场景:	安全访问请求级别2种子请求条件未满足
        假如    HUD当前安全访问状态为??
        当      CANBUS上有安全访问请求，参数SecurityAccessType为0xFF
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为条件未满足

    @SecurityAccess
    场景:	安全访问请求级别1密钥请求报文只有请求级别
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，报文长度为2个字节，参数SecurityAccessType为请求级别1密钥
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @SecurityAccess
    场景:	安全访问请求级别1密钥请求密钥长度错误
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，报文长度为5个字节，参数SecurityAccessType为请求级别1密钥， 参数SecurityKey为0x123456
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @SecurityAccess
    场景:	安全访问请求级别1密钥请求报文长度超长
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，报文长度为1025个字节，参数SecurityAccessType为请求级别1密钥， 参数SecurityKey为0x12345678
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @SecurityAccess, @wip
    场景:	安全访问请求级别1密钥请求条件未满足
        假如    HUD当前安全访问状态为？？
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为条件未满足

    @SecurityAccess
    场景:	安全访问请求级别2密钥请求序列错误
        假如    HUD当前安全访问状态为解锁2
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别2密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为请求序列错误

    @SecurityAccess
    场景:	安全访问请求级别1密钥请求密钥无效
        假如    HUD当前安全访问状态为解锁1
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为0xFFFFFFFF
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为密钥无效

    @SecurityAccess
    场景:	安全访问请求级别1密钥请求超出密钥访问次数限制，延时时间内请求种子
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为0xFFFFFFFF
        而且    CANBUS上信号发送3次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为超出密钥访问次数限制

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数SecurityAccessType为级别1种子，参数NegativeResponseCode为延迟时间未到

    @SecurityAccess
    场景:	安全访问请求级别1密钥请求超出密钥访问次数限制，延时时间内请求密钥
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为0xFFFFFFFF
        而且    CANBUS上信号发送3次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为超出密钥访问次数限制

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为0xFFFFFFFF
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为超出密钥访问次数限制

    @SecurityAccess
    场景:	安全访问请求级别1密钥请求超出密钥访问次数限制，延时时间后请求种子成功，请求密钥错误
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为0xFFFFFFFF
        而且    CANBUS上信号发送3次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为超出密钥访问次数限制

        当      CANBUS上等待10秒后
        而且    CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为安全访问请求级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为0xFFFFFFFF
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为超出密钥访问次数限制

        当      CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为延迟时间未到

    @SecurityAccess
    场景:	安全访问请求级别1密钥请求超出密钥访问次数限制，延时时间后请求种子成功
        假如    HUD当前安全访问状态为锁定
        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为0xFFFFFFFF
        而且    CANBUS上信号发送3次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为超出密钥访问次数限制

        当      CANBUS上等待10秒后
        而且    CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数Sub-Function为级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

    @SecurityAccess
    场景:	从安全访问状态解锁1复位，延时时间内请求种子失败，延时时间后请求种子成功，请求密钥成功
        假如    HUD当前安全访问状态为解锁1
        当      CANBUS上有ECU复位请求，参数为软件复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为软件复位

        当      CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为延迟时间未到

        当      CANBUS上等待10秒后
        而且    CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

    @SecurityAccess
    场景:	从安全访问状态解锁1进入编程会话模式，请求种子成功，请求密钥成功
        假如    HUD当前安全访问状态为解锁1
        当      CANBUS上有诊断会话控制请求，参数为进入扩展诊断会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有安全访问肯定响应，参数Sub-Function为进入扩展诊断会话，参数P2Server3为0x0000，参数P2Server4为0x0000

        当      CANBUS上有诊断会话控制请求，参数为进入编程会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有安全访问肯定响应，参数Sub-Function为进入编程会话，参数P2Server3为0x0000，参数P2Server4为0x0000

        当      CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

    @SecurityAccess
    场景:	从安全访问状态解锁2复位，延时时间内请求种子失败，延时时间后请求种子成功，请求密钥成功
        假如    HUD当前安全访问状态为解锁2
        当      CANBUS上有ECU复位请求，参数为软件复位
        而且    CANBUS上信号发送一次

        那么    CANBUS上有ECU复位肯定响应，参数为软件复位

        当      CANBUS上有安全访问请求，参数为请求级别2种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问否定响应，参数NegativeResponseCode为延迟时间未到

        当      CANBUS上等待10秒后
        而且    CANBUS上有安全访问请求，参数为请求级别2种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别2种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别2密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为安全访问请求级别2密钥

    @SecurityAccess
    场景:	从安全访问状态解锁2进入编程会话模式，请求种子成功，请求密钥成功
        假如    HUD当前安全访问状态为解锁2
        当      CANBUS上有诊断会话控制请求，参数为进入扩展诊断会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有安全访问肯定响应，参数Sub-Function为进入扩展诊断会话，参数P2Server3为0x0000，参数P2Server4为0x0000

        当      CANBUS上有诊断会话控制请求，参数为进入编程会话
        而且    CANBUS上信号发送一次

        那么    CANBUS上有安全访问肯定响应，参数Sub-Function为进入编程会话，参数P2Server3为0x0000，参数P2Server4为0x0000

        当      CANBUS上有安全访问请求，参数为请求级别2种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别2种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别2密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别2密钥

    #@SecurityAccess
    #场景:	从安全访问状态解锁1进入安全访问状态解锁2，请求种子成功，请求密钥成功

    #@SecurityAccess
    #场景:	从安全访问状态解锁2进入安全访问状态解锁1，请求种子成功，请求密钥成功



