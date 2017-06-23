# Created by enrico at 21/06/2017
# Created by enrico at 21/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 数据传输
  ============================================
  请求下载，数据传输，请求退出传输

  @TransferData, @wip
  场景:    数据传输成功
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为从0x00开始，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输肯定响应，参数BlockSequenceCounter为从0x00开始，参数TransferResponseParameterRecord为？？
    而且    CANBUS上循环以上数据传输步骤10次

    当      CANBUS上有退出传输请求
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求退出传输肯定响应

  @TransferData, @wip
  场景:    传输有加密算法数据成功
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x01，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为从0x00开始，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输肯定响应，参数BlockSequenceCounter为从0x00开始，参数TransferResponseParameterRecord为？？
    而且    CANBUS上循环以上数据传输步骤10次

    当      CANBUS上有退出传输请求
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求退出传输肯定响应

  @TransferData, @wip
  场景:    传输有压缩算法数据成功
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x10，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为从0x00开始，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输肯定响应，参数BlockSequenceCounter为从0x00开始，参数TransferResponseParameterRecord为？？
    而且    CANBUS上循环以上数据传输步骤10次

    当      CANBUS上有退出传输请求
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求退出传输肯定响应

  @TransferData, @wip
  场景:    数据传输中有重复blockSequenceCounter数据包，传输成功
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为从0x00开始，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输肯定响应，参数BlockSequenceCounter为从0x00开始，参数TransferResponseParameterRecord为？？
    而且    CANBUS上循环以上数据传输步骤5次

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为0x04，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输肯定响应，参数BlockSequenceCounter为0x04，参数TransferResponseParameterRecord为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为从0x05开始，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输肯定响应，参数BlockSequenceCounter为从0x05开始，参数TransferResponseParameterRecord为？？
    而且    CANBUS上循环以上数据传输步骤5次

    当      CANBUS上有退出传输请求
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求退出传输肯定响应

  @TransferData
  场景:    请求下载请求报文长度只有RequestServiceIdentifier
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，报文长度为1个字节
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @TransferData
  场景:    请求下载请求报文长度只有RequestServiceIdentifier和DataFormatIdentifier
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，报文长度为2个字节，参数DataFormatIdentifier为0x00
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @TransferData
  场景:    请求下载请求报文长度只有RequestServiceIdentifier，DataFormatIdentifier和addressAndLengthFormatIdentifier
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，报文长度为3个字节，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @TransferData, @wip
  场景:    请求下载请求报文长度只有RequestServiceIdentifier，DataFormatIdentifier，addressAndLengthFormatIdentifier和MemoryAddress
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，报文长度为7个字节，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @TransferData, @wip
  场景:    请求下载请求报文长度超长
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，报文长度为1025字节，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @TransferData, @wip
  场景:    请求下载请求，ECU 在接收软件或标定模块的下载过程中收到请求响应条件不满足
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为从0x00开始，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输肯定响应，参数BlockSequenceCounter为从0x00开始，参数TransferResponseParameterRecord为？？
    而且    CANBUS上循环以上步骤10次

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为条件不满足

  @TransferData, @wip
  场景:    请求下载请求，指定数据格式标识(dataFormatIdentifier)无效，响应数据超出范围
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0xFF，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为请求数据超出范围

  @TransferData, @wip
  场景:    请求下载请求，指定地址和长度格式标识(addressAndLengthFormatIdentifier)无效，响应数据超出范围
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x00，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为请求数据超出范围

  @TransferData, @wip
  场景:    请求下载请求，指定内存地址/内存大小(memoryAddress/memorySize)无效， 响应数据超出范围
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为请求数据超出范围

  @TransferData, @wip
  场景:    请求下载请求安全访问拒绝
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为安全访问拒绝

  @TransferData, @wip
  场景:    请求下载请求上传/下载操作拒绝
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2
    假如    HUD当前由于某种故障而拒绝诊断工具的下载操作时？？

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为上传/下载操作拒绝

  @TransferData, @wip
  场景:    数据传输请求报文长度只有RequestServiceIdentifier
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，报文长度为1个字节
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @TransferData, @wip
  场景:    数据传输请求报文长度只有RequestServiceIdentifier和BlockSequenceCounter
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，报文长度为2个字节，参数BlockSequenceCounter为0x00
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @TransferData, @wip
  场景:    数据传输请求报文长度超长
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，报文长度为1025个字节，参数BlockSequenceCounter为0x00，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @TransferData, @wip
  场景:    数据传输请求，顺序错误，当收到服务请求时请求下载或请求上传服务无效
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为请求数据超出范围

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为0x00，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为请求顺序错误

  @TransferData, @wip
  场景:    数据传输请求，顺序错误，如果请求下载或请求上传服务有效，但 ECU 已经在请求下载或请求上传服务中接收到 memorySize 参数确定的全部数据
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为从0x00开始，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输肯定响应，参数BlockSequenceCounter为从0x00开始，参数TransferResponseParameterRecord为？？
    而且    CANBUS上循环以上数据传输步骤100次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为请求顺序错误

  @TransferData, @wip
  场景:    数据传输请求，如果 transferRequestParameterRecord 包含附加控制参数(例如，附加地址 信息)并且控制信息不可用，响应请求数据超出范围
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为0x00，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为请求数据超出范围

  @TransferData, @wip
  场景:    数据传输请求，响应码指示数据传输操作因某些错误停止，响应传输数据暂停
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为0x00，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为传输数据暂停

  @TransferData, @wip
  场景:    数据传输请求，下载模块的长度不满足请求下载服务的请求报文中的 memorySize 参数要求，响应传输数据暂停
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为0x00，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为传输数据暂停

  @TransferData, @wip
  场景:    数据传输请求，如果在数据下载中 ECU 监测到在永久性存储器上删除或编程时的错误，响应一般编程错误
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为0x00，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为一般编程错误

  @TransferData, @wip
  场景:    数据传输请求，如果 ECU 监测到 blockSequenceCounter 序列中的错误，要求发送此响应 码，响应块序列计数器错误
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为从0x00开始，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输肯定响应，参数BlockSequenceCounter为从0x00开始，参数TransferResponseParameterRecord为？？
    而且    CANBUS上循环以上数据传输步骤5次

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为0x03，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为块序列计数器错误

  @TransferData, @wip
  场景:    数据传输请求，如果 ECU 向永久性存储器(例如 Flash 内存)下载数据时主电源脚电压过高，响应一般编程错误
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    假如    HUD当前主电源脚电压过高
    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为0x00，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为电压过高/过低

  @TransferData, @wip
  场景:    数据传输请求，如果 ECU 向永久性存储器(例如 Flash 内存)下载数据时主电源脚电压过低，响应一般编程错误
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    假如    HUD当前主电源脚电压过低
    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为0x00，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输否定响应，参数NegativeResponseCode为电压过高/过低

  @TransferData, @wip
  场景:    请求退出传输，报文长度超长
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为从0x00开始，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输肯定响应，参数BlockSequenceCounter为从0x00开始，参数TransferResponseParameterRecord为？？
    而且    CANBUS上循环以上数据传输步骤10次

    当      CANBUS上有退出传输请求，报文长度为1025个字节
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求退出传输否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @TransferData, @wip
  场景:    请求退出传输，接收到此服务请求时编程进程没有完成，响应请求顺序错误
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载肯定响应，参数LengthFormatIdentifier为？？，参数MaxNumberOfBlockLength为？？

    当      CANBUS上有数据传输请求，参数BlockSequenceCounter为0x00，参数TransferRequestParameterRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有数据传输肯定响应，参数BlockSequenceCounter为0x00，参数TransferResponseParameterRecord为？？

    当      CANBUS上有退出传输请求
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求退出传输否定响应，参数NegativeResponseCode为请求顺序错误

  @TransferData, @wip
  场景:    请求退出传输，请求下载或请求上传服务无效，响应请求顺序错误
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为解锁2

    当      CANBUS上有请求下载请求，参数DataFormatIdentifier为0x00，参数addressAndLengthFormatIdentifier为0x44，参数MemoryAddress为？？，参数MemorySize为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求下载否定响应，参数NegativeResponseCode为请求数据超出范围

    当      CANBUS上有退出传输请求
    而且    CANBUS上信号发送1次

    那么    CANBUS上有请求退出传输否定响应，参数NegativeResponseCode为请求顺序错误

