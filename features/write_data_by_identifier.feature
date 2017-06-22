# Created by enrico at 20/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 写入数据
============================================
    写入数据

    @WriteDataByIdentifier, @wip
    场景:	写入ECU变码数据成功
        假如    HUD当前诊断会话模式为编程会话

        当      CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

        当      CANBUS上有写入数据请求，参数DataIdentifier为ECU变码，参数DataRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有写入数据肯定响应，参数DataIdentifier为ECU变码


    @WriteDataByIdentifier, @wip
    场景:	写入车身号码VIN编码格式数据成功
        假如    HUD当前诊断会话模式为编程会话

        当      CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

        当      CANBUS上有写入数据请求，参数DataIdentifier为车身号码VIN编码格式，参数DataRecord为??
        而且    CANBUS上信号发送1次

        那么    CANBUS上有写入数据肯定响应，参数DataIdentifier为车身号码VIN编码格式

    @WriteDataByIdentifier
    场景:	写入数据请求，报文长度只有1字节
        假如    HUD当前诊断会话模式为编程会话

        当      CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

        当      CANBUS上有写入数据请求，报文长度为1字节
        而且    CANBUS上信号发送1次

        那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @WriteDataByIdentifier
    场景:	写入数据请求，报文长度只有3字节
        假如    HUD当前诊断会话模式为编程会话

        当      CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

        当      CANBUS上有写入数据请求，报文长度为3字节，参数DataIdentifier为ECU变码
        而且    CANBUS上信号发送1次

        那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @WriteDataByIdentifier, @wip
    场景:	写入数据请求，报文长度超长
        假如    HUD当前诊断会话模式为编程会话

        当      CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

        当      CANBUS上有写入数据请求，报文长度为？？字节，参数DataIdentifier为ECU变码，参数DataRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @WriteDataByIdentifier, @wip
    场景:	写入数据请求，条件不满足
        假如    HUD当前诊断会话模式为扩展诊断会话

        当      CANBUS上有写入数据请求，参数DataIdentifier为ECU变码，参数DataRecord为??
        而且    CANBUS上信号发送1次

        那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为条件不满足

    @WriteDataByIdentifier, @wip
    场景:	写入数据请求，数据标识符不支持，请求数据超出范围
        假如    HUD当前诊断会话模式为编程会话

        当      CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

        当      CANBUS上有写入数据请求，参数DataIdentifier为0xFF，参数DataRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为请求数据超出范围

    @WriteDataByIdentifier, @wip
    场景:	写入数据请求，数据标识符只读，请求数据超出范围
        假如    HUD当前诊断会话模式为编程会话

        当      CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

        当      CANBUS上有写入数据请求，参数DataIdentifier为北汽银翔的备用零部件编号，参数DataRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为请求数据超出范围

    @WriteDataByIdentifier, @wip
    场景:	写入数据请求，请求安全访问拒绝
        假如    HUD当前诊断会话模式为编程会话

        当      CANBUS上有写入数据请求，参数DataIdentifier为ECU变码，参数DataRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为请求安全访问拒绝

    @WriteDataByIdentifier, @wip
    场景:	写入数据请求，请求一般编程错误
        假如    HUD当前诊断会话模式为编程会话

        当      CANBUS上有安全访问请求，参数为请求级别1种子
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

        当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
        而且    CANBUS上信号发送1次

        那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

        当      CANBUS上有写入数据请求，参数DataIdentifier为ECU变码，参数DataRecord为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为请求一般编程错误


