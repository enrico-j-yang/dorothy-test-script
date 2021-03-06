# Created by enrico at 20/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 读写数据
  ============================================
  读取数据，写入数据

#### 肯定响应用例 ####
  @ReadDataByIdentifier, @wip
  场景大纲:    读取BOOT软件版本号成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为BOOT软件版本号
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为BOOT软件版本号，参数DataRecord为？？

    例子:   读取BOOT软件版本号用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取应用软件版本号成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为应用软件版本号
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为应用软件版本号，参数DataRecord为？？

    例子:   读取应用软件版本号用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取HMI软件版本号成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为HMI软件版本号
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为HMI软件版本号，参数DataRecord为？？

    例子:   读取HMI软件版本号用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取备用零部件编号成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为备用零部件编号
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为备用零部件编号，参数DataRecord为？？

    例子:   读取备用零部件编号用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:   读取系统供应商公司名称代码成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为系统供应商公司名称代码
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为系统供应商公司名称代码，参数DataRecord为？？

    例子:   读取系统供应商公司名称代码用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取ECU批次编号成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为ECU批次编号
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为ECU批次编号，参数DataRecord为？？

    例子:   读取ECU批次编号用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取车身号码成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为车身号码
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为车身号码，参数DataRecord为？？

    例子:   读取车身号码用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取供应商硬件版本号成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为供应商硬件版本号
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为供应商硬件版本号，参数DataRecord为？？

    例子:   读取供应商硬件版本号用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取供应商软件编号成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为供应商软件编号
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为供应商软件编号，参数DataRecord为？？

    例子:   读取供应商软件编号用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取供应商软件版本号成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为供应商软件版本号
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为供应商软件版本号，参数DataRecord为？？

    例子:   读取供应商软件版本号用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取ECU系统名称成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为ECU系统名称
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为ECU系统名称，参数DataRecord为？？

    例子:   读取ECU系统名称用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取多个数据成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为BOOT软件版本号+应用软件版本号+HMI软件版本号+备用零部件编号+系统供应商公司名称代码+ECU批次编号+车身号码+供应商硬件版本号+供应商软件编号+供应商软件版本号+ECU系统名称
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier#1为BOOT软件版本号，参数DataRecord#1为？？，参数DataIdentifier#2为应用软件版本号，参数DataRecord#2为？？，参数DataIdentifier#3为HMI软件版本号，参数DataRecord#3为？？，参数DataIdentifier#4为备用零部件编号，参数DataRecord#4为？？，参数DataIdentifier#5为系统供应商公司名称代码，参数DataRecord#5为？？，参数DataIdentifier#6为ECU批次编号，参数DataRecord#6为？？，参数DataIdentifier#7为车身号码，参数DataRecord#7为？？，参数DataIdentifier#8为供应商硬件版本号，参数DataRecord#8为？？，参数DataIdentifier#9为供应商软件编号，参数DataRecord#9为？？，参数DataIdentifier#10为供应商软件版本号，参数DataRecord#10为？？，参数DataIdentifier#11为ECU系统名称，参数DataRecord#11为？？

    例子:   读取多个数据用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

#### 否定响应用例 ####
  @ReadDataByIdentifier
  场景大纲:    读取数据，报文长度只有RequestServiceIdentifier，响应报文长度错误或者格式非法
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，报文长度为1个字节
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   读取数据，报文长度只有RequestServiceIdentifier用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取数据，如果 ECU 的操作条件不满足执行相应动作的要求，响应条件未满足
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为BOOT软件版本号
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据否定响应，参数NegativeResponseCode为条件未满足

    例子:   读取数据，如果 ECU 的操作条件不满足执行相应动作的要求用例
      | session environment | session mode | comm types      |
      | 应用程序             | 编程会话      | 以物理寻址方式的  |
      | 应用程序             | 编程会话      | 以功能寻址方式的  |
      | 引导程序             | 默认会话      | 以物理寻址方式的  |
      | 引导程序             | 默认会话      | 以功能寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 编程会话      | 以物理寻址方式的  |
      | 引导程序             | 编程会话      | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取数据，没有一个请求的 DID 值被设备支持，响应请求超出范围
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为0xFF
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据否定响应，参数NegativeResponseCode为请求超出范围

    例子:   读取数据，没有一个请求的 DID 值被设备支持用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取数据，诊断工具一次请求的 DID 个数超过允许的最大值，响应请求超出范围
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为BOOT软件版本号+应用软件版本号+HMI软件版本号+备用零部件编号+系统供应商公司名称代码+ECU批次编号+车身号码+供应商硬件版本号+供应商软件编号+供应商软件版本号+ECU系统名称??
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据否定响应，参数NegativeResponseCode为请求超出范围

    例子:   读取数据，诊断工具一次请求的 DID 个数超过允许的最大值用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

  @ReadDataByIdentifier, @wip
  场景大纲:    读取数据，如果至少一个 DID 是受保护的而且 ECU 没有处于解锁状态，响应安全访问拒绝
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定？？

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为BOOT软件版本号
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据否定响应，参数NegativeResponseCode为安全访问拒绝

    例子:   读取数据，诊断工具一次请求的 DID 个数超过允许的最大值用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |

#### 肯定响应用例 ####
  @WriteDataByIdentifier, @wip
  场景大纲:    写入ECU变码数据成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上以物理寻址方式的有安全访问请求，参数为请求级别1种子
    而且    CANBUS上信号发送1次

    那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

    当      CANBUS上以物理寻址方式的有安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
    而且    CANBUS上信号发送1次

    那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

    当      CANBUS上以物理寻址方式的有写入数据请求，参数DataIdentifier为ECU变码，参数DataRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有写入数据肯定响应，参数DataIdentifier为ECU变码

    当      CANBUS上<comm types>有读取数据请求，参数DataIdentifier为ECU变码
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为ECU变码，参数DataRecord为？？

    例子:   写入ECU变码数据用例
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @WriteDataByIdentifier, @wip
  场景大纲:    写入车身号码VIN编码格式数据成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的安全访问请求，参数为请求级别1种子
    而且    CANBUS上信号发送1次

    那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1种子，参数SecuritySeed为有效值

    当      CANBUS上有以物理寻址方式的安全访问请求，参数SecurityAccessType为请求级别1密钥，参数SecurityKey为有效值
    而且    CANBUS上信号发送1次

    那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别1密钥

    当      CANBUS上有以物理寻址方式的写入数据请求，参数DataIdentifier为车身号码VIN编码格式，参数DataRecord为??
    而且    CANBUS上信号发送1次

    那么    CANBUS上有写入数据肯定响应，参数DataIdentifier为车身号码VIN编码格式

    当      CANBUS上有<comm types>读取数据请求，参数DataIdentifier为车身号码
    而且    CANBUS上信号发送1次

    那么    CANBUS上有读取数据肯定响应，参数DataIdentifier为车身号码，参数DataRecord为？？

    例子:   写入ECU变码数据用例
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

#### 否定响应用例 ####
  @WriteDataByIdentifier
  场景:    写入数据请求，报文长度只有1字节
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为解锁级别1

    当      CANBUS上有以物理寻址方式的写入数据请求，报文长度为1字节
    而且    CANBUS上信号发送1次

    那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @WriteDataByIdentifier
  场景:    写入数据请求，报文长度只有3字节
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为解锁级别1

    当      CANBUS上有以物理寻址方式的写入数据请求，报文长度为3字节，参数DataIdentifier为ECU变码
    而且    CANBUS上信号发送1次

    那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @WriteDataByIdentifier, @wip
  场景:    写入数据请求，报文长度超长
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为解锁级别1

    当      CANBUS上有以物理寻址方式的写入数据请求，报文长度为？？字节，参数DataIdentifier为ECU变码，参数DataRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

  @WriteDataByIdentifier, @wip
  场景:    写入数据请求，条件不满足
    假如    HUD当前诊断模式运行环境为引导程序？？
    假如    HUD当前诊断会话模式为扩展诊断会话？？
    假如    HUD当前安全访问状态为解锁级别1？？

    当      CANBUS上有以物理寻址方式的写入数据请求，参数DataIdentifier为ECU变码，参数DataRecord为??
    而且    CANBUS上信号发送1次

    那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为条件不满足

  @WriteDataByIdentifier, @wip
  场景:    写入数据请求，数据标识符不支持，请求数据超出范围
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为解锁级别1

    当      CANBUS上有以物理寻址方式的写入数据请求，参数DataIdentifier为0xFF，参数DataRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为请求数据超出范围

  @WriteDataByIdentifier, @wip
  场景:    写入数据请求，数据标识符只读，请求数据超出范围
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为解锁级别1

    当      CANBUS上有以物理寻址方式的写入数据请求，参数DataIdentifier为北汽银翔的备用零部件编号，参数DataRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为请求数据超出范围

  @WriteDataByIdentifier, @wip
  场景:    写入数据请求，请求安全访问拒绝
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的写入数据请求，参数DataIdentifier为ECU变码，参数DataRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为请求安全访问拒绝

  @WriteDataByIdentifier, @wip
  场景:    写入数据请求，请求一般编程错误
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为解锁级别1

    当      CANBUS上有以物理寻址方式的写入数据请求，参数DataIdentifier为ECU变码，参数DataRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有写入数据否定响应，参数NegativeResponseCode为请求一般编程错误


