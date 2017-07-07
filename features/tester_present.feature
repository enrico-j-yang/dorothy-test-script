# Created by enrico at 22/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 诊断设备在线
  ============================================
  诊断设备在线

#### 禁止肯定响应位为假的肯定响应用例 ####
  @TesterPresent
  场景大纲:    诊断设备在线请求成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断设备在线请求，参数ZeroSubFunction为zeroSubFunction，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断设备在线肯定响应，参数ZeroSubFunction为zeroSubFunction

    例子:   禁止肯定响应位为假的肯定响应用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 应用程序             | 编程会话      | 以物理寻址方式的  |
      | 应用程序             | 编程会话      | 以功能寻址方式的  |
      | 引导程序             | 默认会话      | 以物理寻址方式的  |
      | 引导程序             | 默认会话      | 以功能寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 编程会话      | 以物理寻址方式的  |
      | 引导程序             | 编程会话      | 以功能寻址方式的  |

#### 禁止肯定响应位为真的肯定响应用例 ####
  @TesterPresent
  场景大纲:    扩展诊断会话，禁止肯定响应位为真，诊断设备在线请求成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断设备在线请求，参数ZeroSubFunction为zeroSubFunction，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    假如    CANBUS上速度为0km/h
    假如    CANBUS上有引擎转速为0
    当      CANBUS上有通信控制请求，参数Sub-Function为使能接收和发送，参数CommunicationType为常规应用报文，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收和发送

    例子:   扩展诊断会话，禁止肯定响应位为真的肯定响应用例
      | session environment | comm types      |
      | 应用程序             | 以物理寻址方式的  |
      | 应用程序             | 以功能寻址方式的  |
      | 引导程序             | 以物理寻址方式的  |
      | 引导程序             | 以功能寻址方式的  |

  @TesterPresent, @wip
  场景大纲:    编程会话，禁止肯定响应位为真，诊断设备在线请求成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断设备在线请求，参数ZeroSubFunction为zeroSubFunction，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    假如    HUD切换到引导程序？？

    当      CANBUS上有物理寻址方式的安全访问请求，参数SecurityAccessType为请求级别2种子
    而且    CANBUS上信号发送1次

    那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为安全访问请求级别2种子，参数SecuritySeed为有效值

    当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别2种子
    而且    CANBUS上信号发送1次

    那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别2种子，参数SecuritySeed为0x00000000

    例子:   编程会话，禁止肯定响应位为假的肯定响应用例
      | session environment | comm types      |
      | 应用程序             | 以物理寻址方式的  |
      | 应用程序             | 以功能寻址方式的  |
      | 引导程序             | 以物理寻址方式的  |
      | 引导程序             | 以功能寻址方式的  |


  @TesterPresent
  场景大纲:    默认会话，禁止肯定响应位为真，诊断设备在线请求成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断设备在线请求，参数ZeroSubFunction为zeroSubFunction，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入编程会话，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为条件未满足

    例子:   默认会话，禁止肯定响应位为假的肯定响应用例
      | session environment | comm types      |
      | 应用程序             | 以物理寻址方式的  |
      | 应用程序             | 以功能寻址方式的  |
      | 引导程序             | 以物理寻址方式的  |
      | 引导程序             | 以功能寻址方式的  |

#### 编程会话超时用例 ####
  @TesterPresent, @wip
  场景大纲:    编程会话超时，禁止肯定响应位为真，诊断设备在线请求成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断设备在线请求，参数ZeroSubFunction为zeroSubFunction，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    假如    HUD切换到引导程序？？

    当      CANBUS上有物理寻址方式的安全访问请求，参数SecurityAccessType为请求级别2种子
    而且    CANBUS上信号发送1次

    那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为安全访问请求级别2种子，参数SecuritySeed为有效值

    当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别2种子
    而且    CANBUS上信号发送1次

    那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别2种子，参数SecuritySeed为0x00000000

    当      CANBUS上信号断开5秒

    而且    HUD重启应用程序？？

    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入扩展诊断会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入扩展诊断会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   编程会话，禁止肯定响应位为假的肯定响应用例
      | session environment | comm types      |
      | 应用程序             | 以物理寻址方式的  |
      | 应用程序             | 以功能寻址方式的  |
      | 引导程序             | 以物理寻址方式的  |
      | 引导程序             | 以功能寻址方式的  |

#### 否定响应用例 ####
  @TesterPresent
  场景大纲:    诊断设备在线请求，不支持子功能
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断设备在线请求，参数ZeroSubFunction为0x7F，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断设备在线否定响应，参数NegativeResponseCode为不支持子功能

    例子:   不支持子功能的否定响应用例
      | session environment | session mode | comm types      | SPRMB |
      | 应用程序             | 默认会话      | 以物理寻址方式的  | 假     |
      | 应用程序             | 默认会话      | 以功能寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 应用程序             | 编程会话      | 以物理寻址方式的  | 假     |
      | 应用程序             | 编程会话      | 以功能寻址方式的  | 假     |
      | 引导程序             | 默认会话      | 以物理寻址方式的  | 假     |
      | 引导程序             | 默认会话      | 以功能寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 假     |
      | 应用程序             | 默认会话      | 以物理寻址方式的  | 真     |
      | 应用程序             | 默认会话      | 以功能寻址方式的  | 真     |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 应用程序             | 编程会话      | 以物理寻址方式的  | 真     |
      | 应用程序             | 编程会话      | 以功能寻址方式的  | 真     |
      | 引导程序             | 默认会话      | 以物理寻址方式的  | 真     |
      | 引导程序             | 默认会话      | 以功能寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 真     |

  @TesterPresent
  场景大纲:    诊断设备在线请求，报文只有RequestServiceIdentifier
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上<comm types>有诊断设备在线请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断设备在线否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   报文只有RequestServiceIdentifier的否定响应用例
      | session environment | session mode | comm types      |
      | 应用程序             | 默认会话      | 以物理寻址方式的  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 应用程序             | 编程会话      | 以物理寻址方式的  |
      | 应用程序             | 编程会话      | 以功能寻址方式的  |
      | 引导程序             | 默认会话      | 以物理寻址方式的  |
      | 引导程序             | 默认会话      | 以功能寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 编程会话      | 以物理寻址方式的  |
      | 引导程序             | 编程会话      | 以功能寻址方式的  |

  @TesterPresent
  场景大纲:    诊断设备在线请求，报文长度超长
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上<comm types>有诊断设备在线请求，报文长度为1025个字节，参数ZeroSubFunction为zeroSubFunction，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断设备在线否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   报文长度超长的否定响应用例
      | session environment | session mode | comm types      | SPRMB |
      | 应用程序             | 默认会话      | 以物理寻址方式的  | 假     |
      | 应用程序             | 默认会话      | 以功能寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 应用程序             | 编程会话      | 以物理寻址方式的  | 假     |
      | 应用程序             | 编程会话      | 以功能寻址方式的  | 假     |
      | 引导程序             | 默认会话      | 以物理寻址方式的  | 假     |
      | 引导程序             | 默认会话      | 以功能寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 假     |
      | 应用程序             | 默认会话      | 以物理寻址方式的  | 真     |
      | 应用程序             | 默认会话      | 以功能寻址方式的  | 真     |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 应用程序             | 编程会话      | 以物理寻址方式的  | 真     |
      | 应用程序             | 编程会话      | 以功能寻址方式的  | 真     |
      | 引导程序             | 默认会话      | 以物理寻址方式的  | 真     |
      | 引导程序             | 默认会话      | 以功能寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 真     |

