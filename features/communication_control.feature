# Created by enrico at 20/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 通信控制
  ============================================
  通信控制

#### 运行环境为应用程序的肯定响应用例 ####
  @CommunicationControl
  场景大纲:    运行环境为应用程序，通信控制常规应用报文使能接收和发送请求成功
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为使能接收和发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收和发送

    当      CANBUS上有<comm types>诊断设备在线请求，参数ZeroSubFunction为zeroSubFunction，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断设备在线肯定响应，参数ZeroSubFunction为zeroSubFunction

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @CommunicationControl
  场景大纲:    运行环境为应用程序，通信控制常规应用报文使能接收且禁止发送请求成功
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为使能接收且禁止发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收且禁止发送

    当      CANBUS上有<comm types>诊断设备在线请求，参数ZeroSubFunction为zeroSubFunction，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上无诊断设备在线肯定响应，参数ZeroSubFunction为zeroSubFunction

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @CommunicationControl, @wip
  场景大纲:    运行环境为应用程序，通信控制常规应用报文禁止接收且使能发送请求成功
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为禁止接收且使能发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收且使能发送
    那么    HUD不主动发信息，如何判断现在的状态是禁止接收且使能发送？？

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @CommunicationControl, @wip
  场景大纲:    运行环境为应用程序，通信控制常规应用报文禁止接收和发送请求成功
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为禁止接收和发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收和发送
    那么    HUD不主动发信息，如何判断现在的状态是禁止接收且使能发送？？

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @CommunicationControl
  场景大纲:    运行环境为应用程序，通信控制网络管理报文使能接收且禁止发送请求成功
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为使能接收和发送，禁止肯定响应位为假，参数CommunicationType为网络管理报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收和发送

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @CommunicationControl
  场景大纲:    运行环境为应用程序，通信控制常规应用报文和网络管理报文使能接收且禁止发送请求成功
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为使能接收和发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文和网络管理报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收和发送

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

#### 运行环境为引导程序的肯定响应用例 ####
  @CommunicationControl
  场景大纲:    运行环境为引导程序，通信控制常规应用报文使能接收且禁止发送请求成功
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为使能接收且禁止发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收且禁止发送

    例子:   通信控制常规应用报文使能接收且禁止发送用例
      | session environment | session mode | comm types      |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 编程会话      | 以物理寻址方式的  |
      | 引导程序             | 编程会话      | 以功能寻址方式的  |

  @CommunicationControl
  场景大纲:    运行环境为引导程序，通信控制常规应用报文禁止接收和发送请求成功
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为禁止接收和发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收和发送

    例子:   通信控制常规应用报文禁止接收和发送请求用例
      | session environment | session mode | comm types      |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 编程会话      | 以物理寻址方式的  |
      | 引导程序             | 编程会话      | 以功能寻址方式的  |

#### 否定响应用例 ####
  @CommunicationControl
  场景大纲:    通信控制常规应用报文使能接收和发送请求不支持子功能
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为0x7F，禁止肯定响应位为<SPRMB>，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为不支持子功能

    例子:   通信控制常规应用报文使能接收和发送请求不支持子功能用例
      | session environment | session mode | comm types      | SPRMB |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 真     |

  @CommunicationControl
  场景大纲:    通信控制常规应用报文使能接收和发送请求报文长度只有1个字节
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为长度错误或者格式非法

    例子:   通信控制常规应用报文使能接收和发送请求报文长度只有1个字节用例
      | session environment | session mode | comm types      |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 编程会话      | 以物理寻址方式的  |
      | 引导程序             | 编程会话      | 以功能寻址方式的  |

  @CommunicationControl
  场景大纲:    通信控制常规应用报文使能接收和发送请求报文长度只有2个字节
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，报文长度为2个字节，参数Sub-Function为使能接收且禁止发送，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为长度错误或者格式非法

    例子:   通信控制常规应用报文使能接收和发送请求报文长度只有2个字节用例
      | session environment | session mode | comm types      | SPRMB |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 真     |

  @CommunicationControl
  场景大纲:    通信控制常规应用报文使能接收和发送请求报文超长
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，报文长度为1025个字节，参数Sub-Function为使能接收且禁止发送，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为长度错误或者格式非法

    例子:   通信控制常规应用报文使能接收和发送请求报文超长用例
      | session environment | session mode | comm types      | SPRMB |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 真     |

  @CommunicationControl
  场景大纲:    通信控制常规应用报文使能接收和发送请求条件未满足
    假如    CANBUS上速度为50km/h
    而且    CANBUS上有引擎转速为1000
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为<Sub-Function>，禁止肯定响应位为<SPRMB>，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为条件未满足

    例子:   通信控制常规应用报文使能接收和发送请求条件未满足用例
      | session environment | session mode | comm types      | SPRMB |  Sub-Function  |
      | 应用程序             | 默认会话      | 以物理寻址方式的  | 假     |  使能接收和发送  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  | 假     |  使能收禁止发   |
      | 应用程序             | 编程会话      | 以物理寻址方式的  | 假     |  禁止收使能发   |
      | 应用程序             | 编程会话      | 以功能寻址方式的  | 假     |  禁止收发       |
      | 引导程序             | 默认会话      | 以物理寻址方式的  | 假     |  禁止收发       |
      | 引导程序             | 默认会话      | 以功能寻址方式的  | 假     |  禁止收使能发   |
      | 引导程序             | 默认会话      | 以物理寻址方式的  | 假     |  使能收禁止发   |
      | 引导程序             | 默认会话      | 以功能寻址方式的  | 假     |  使能接收和发送  |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |  使能收禁止发   |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |  禁止收使能发   |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 假     |  禁止收发       |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 假     |  使能接收和发送  |
      | 应用程序             | 默认会话      | 以物理寻址方式的  | 真     |  使能接收和发送  |
      | 应用程序             | 默认会话      | 以功能寻址方式的  | 真     |  使能收禁止发   |
      | 应用程序             | 编程会话      | 以物理寻址方式的  | 真     |  禁止收使能发   |
      | 应用程序             | 编程会话      | 以功能寻址方式的  | 真     |  禁止收发       |
      | 引导程序             | 默认会话      | 以物理寻址方式的  | 真     |  禁止收发       |
      | 引导程序             | 默认会话      | 以功能寻址方式的  | 真     |  禁止收使能发   |
      | 引导程序             | 默认会话      | 以物理寻址方式的  | 真     |  使能收禁止发   |
      | 引导程序             | 默认会话      | 以功能寻址方式的  | 真     |  使能接收和发送  |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |  使能收禁止发   |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |  禁止收使能发   |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 真     |  禁止收发       |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 真     |  使能接收和发送  |

  @CommunicationControl
  场景大纲:    通信控制常规应用报文使能接收和发送请求超出范围
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为使能接收和发送，禁止肯定响应位为<SPRMB>，参数CommunicationType为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制否定响应，参数NegativeResponseCode为请求超出范围

    例子:   通信控制常规应用报文使能接收和发送请求条件未满足用例
      | session environment | session mode | comm types      | SPRMB |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 假     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 假     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 假     |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 真     |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 真     |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 真     |

#### 通信控制模式切换用例 ####
  @CommunicationControl
  场景大纲:    从通信控制禁止接收和发送，切换到使能接收和发送请求成功
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为禁止接收和发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收和发送

    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为使能接收和发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收和发送

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @CommunicationControl, @wip
  场景大纲:    从通信控制禁止接收和发送，硬件复位到使能接收和发送请求成功
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为禁止接收和发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数NegativeResponseCode为禁止接收和发送

    当      CANBUS上有<comm types>ECU复位请求，参数Sub-Function为硬件复位，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有ECU复位肯定响应，参数Sub-Function为硬件复位
    而且    如何判断恢复到使能接收和发送状态??

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @CommunicationControl
  场景大纲:    从通信控制禁止接收和发送，软件复位到使能接收和发送请求成功
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有通信控制请求，参数Sub-Function为禁止接收和发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有<comm types>通信控制肯定响应，参数Sub-Function为禁止接收和发送

    当      CANBUS上有<comm types>ECU复位请求，参数Sub-Function为软件复位，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有ECU复位肯定响应，参数Sub-Function为软件复位

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @CommunicationControl, @wip
  场景大纲:    从扩展诊断会话，通信控制禁止接收和发送，进入默认会话，使能接收和发送请求成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为禁止接收和发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收和发送

    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入默认会话
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，禁止肯定响应位为假，参数P2Server3为0x0000，参数P2Server4为0x0000
    而且    如何判断恢复到使能接收和发送状态??

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @CommunicationControl, @wip
  场景大纲:    从编程会话，通信控制禁止接收和发送，进入默认会话，使能接收和发送请求成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为锁定
    假如    CANBUS上速度为0km/h
    而且    CANBUS上有引擎转速为0
    当      CANBUS上有<comm types>通信控制请求，参数Sub-Function为禁止接收和发送，禁止肯定响应位为假，参数CommunicationType为常规应用报文
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为禁止接收和发送

    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入默认会话
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |


