# Created by enrico at 21/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 请求下载
============================================
    请求下载

    @RequestDownload, @wip
    场景:	请求下载成功
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2

        当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    @RequestDownload, @wip
    场景:	请求下载有加密算法成功
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2

        当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x01，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    @RequestDownload, @wip
    场景:	请求下载有压缩算法成功
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2

        当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x10，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    @RequestDownload
    场景:	请求下载请求报文长度只有RequestServiceIdentifier
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2

        当      CANBUS上有请求下载请求，只有1个字节
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @RequestDownload
    场景:	请求下载请求报文长度只有RequestServiceIdentifier和DataFormatIdentifier
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2

        当      CANBUS上有请求下载请求，只有2个字节，参数DataFormatIdentifier为0x00
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @RequestDownload
    场景:	请求下载请求报文长度只有RequestServiceIdentifier，DataFormatIdentifier和addressAndLengthFormatIdentifier
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2

        当      CANBUS上有请求下载请求，只有3个字节，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @RequestDownload, @wip
    场景:	请求下载请求报文长度只有RequestServiceIdentifier，DataFormatIdentifier，addressAndLengthFormatIdentifier和MemoryAddress
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2

        当      CANBUS上有请求下载请求，只有7个字节，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @RequestDownload, @wip
    场景:	请求下载请求报文长度超长
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2

        当      CANBUS上有请求下载请求，报文长度为1025字节，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    @RequestDownload, @wip
    场景:	请求下载请求，ECU 在接收软件或标定模块的下载过程中收到请求响应条件不满足
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2
        假如    HUD当前为下载过程中

        当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为条件不满足

    @RequestDownload, @wip
    场景:	请求下载请求，指定数据格式标识(dataFormatIdentifier)无效，响应数据超出范围
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2

        当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0xFF，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为请求数据超出范围

    @RequestDownload, @wip
    场景:	请求下载请求，指定地址和长度格式标识(addressAndLengthFormatIdentifier)无效，响应数据超出范围
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2

        当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x00，参数MemoryAddress为？？，参数MemorySize为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为请求数据超出范围

    @RequestDownload, @wip
    场景:	请求下载请求，指定内存地址/内存大小(memoryAddress/memorySize)无效， 响应数据超出范围
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2

        当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为请求数据超出范围

    @RequestDownload, @wip
    场景:	请求下载请求安全访问拒绝
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁1

        当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为安全访问拒绝

    @RequestDownload, @wip
    场景:	请求下载请求上传/下载操作拒绝
        假如    HUD当前诊断会话模式为编程会话
        假如    HUD当前安全访问状态为解锁2
        假如    HUD当前由于某种故障而拒绝诊断工具的下载操作时？？

        当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
        而且    CANBUS上信号发送1次

        那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为上传/下载操作拒绝

