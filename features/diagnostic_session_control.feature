# -*- coding: utf-8 -*-
# language: zh-CN

功能: 诊断会话控制
  ============================================
  诊断会话控制

#### 应用程序禁止肯定响应位为假的肯定响应用例 ####
  @DiagnosticSessionControl
  场景大纲:    从默认会话进入默认会话成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入默认会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl
  场景大纲:    从默认会话进入扩展诊断会话成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入扩展诊断会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入扩展诊断会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl
  场景大纲:    从扩展诊断会话进入扩展诊断会话成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入扩展诊断会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入扩展诊断会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl
  场景大纲:    从扩展诊断会话进入默认会话成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入默认会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl
  场景大纲:    从扩展诊断会话进入编程会话成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入编程会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入编程会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl
  场景大纲:    从编程会话进入编程会话成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入编程会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入编程会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl
  场景大纲:    从编程会话进入默认会话成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入默认会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

#### 禁止肯定响应位为真的肯定响应用例 ####
  @DiagnosticSessionControl
  场景大纲:    禁止肯定响应位为真，从默认会话进入扩展诊断会话成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入扩展诊断会话，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    假如    CANBUS上速度为0km/h
    假如    CANBUS上有引擎转速为0
    当      CANBUS上有通信控制请求，参数Sub-Function为使能接收和发送，参数CommunicationType为常规应用报文，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有通信控制肯定响应，参数Sub-Function为使能接收和发送

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl
  场景大纲:    禁止肯定响应位为真，从扩展诊断会话进入默认会话成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入默认会话，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入编程会话，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为条件未满足

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl, @wip
  场景大纲:    禁止肯定响应位为真，从扩展诊断会话进入编程会话成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入编程会话，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    假如    HUD切换到引导程序？？

    当      CANBUS上有物理寻址方式的安全访问请求，参数SecurityAccessType为请求级别2种子
    而且    CANBUS上信号发送1次

    那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为安全访问请求级别2种子，参数SecuritySeed为有效值

    当      CANBUS上有安全访问请求，参数SecurityAccessType为请求级别2种子
    而且    CANBUS上信号发送1次

    那么    CANBUS上有安全访问肯定响应，参数SecurityAccessType为级别2种子，参数SecuritySeed为0x00000000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl
  场景大纲:    禁止肯定响应位为真，从编程会话进入默认会话成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入默认会话，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入扩展诊断会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入扩展诊断会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

#### 引导程序肯定响应用例 ####
  @DiagnosticSessionControl
  场景大纲:    在引导程序下，从默认会话进入扩展诊断会话成功
    假如    HUD当前诊断模式运行环境为引导程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入扩展诊断会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入扩展诊断会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl, @wip
  场景大纲:    在引导程序下，从扩展诊断会话进入默认会话成功
    假如    HUD当前诊断模式运行环境为引导程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入默认会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，参数P2Server3为0x0000，参数P2Server4为0x0000
    而且    HUD重启应用程序？？

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl
  场景大纲:    在引导程序下，从扩展诊断会话进入编程会话成功
    假如    HUD当前诊断模式运行环境为引导程序
    假如    HUD当前诊断会话模式为扩展诊断会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入编程会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入编程会话，参数P2Server3为0x0000，参数P2Server4为0x0000

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl, @wip
  场景大纲:    在引导程序下，从编程会话进入默认会话成功
    假如    HUD当前诊断模式运行环境为引导程序
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入默认会话，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制肯定响应，参数Sub-Function为进入默认会话，参数P2Server3为0x0000，参数P2Server4为0x0000
    而且    HUD重启应用程序？？

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

#### 应用程序否定响应用例 ####
  @DiagnosticSessionControl
  场景大纲:    诊断会话控制请求子功能参数不支持
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为非法值，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为子功能不支持

    例子:   寻址方式与禁止肯定响应组合
      | comm types      | SPRMB |
      | 以物理寻址方式的  | 假    |
      | 以功能寻址方式的  | 假    |
      | 以物理寻址方式的  | 真    |
      | 以功能寻址方式的  | 真    |

  @DiagnosticSessionControl
  场景大纲:    诊断会话控制请求报文长度错误
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为报文长度错误

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl
  场景大纲:    诊断会话控制请求超长
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，报文长度为1025个字节，参数Sub-Function为进入扩展诊断会话，禁止肯定响应位为<SPRMB>，其余字节填充0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为报文长度错误

    例子:   寻址方式与禁止肯定响应组合
      | comm types      | SPRMB |
      | 以物理寻址方式的  | 假    |
      | 以功能寻址方式的  | 假    |
      | 以物理寻址方式的  | 真    |
      | 以功能寻址方式的  | 真    |

  @DiagnosticSessionControl
  场景大纲:    从默认会话进入编程会话失败
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入编程会话，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为条件未满足

    例子:   寻址方式与禁止肯定响应组合
      | comm types      | SPRMB |
      | 以物理寻址方式的  | 假    |
      | 以功能寻址方式的  | 假    |
      | 以物理寻址方式的  | 真    |
      | 以功能寻址方式的  | 真    |

  @DiagnosticSessionControl
  场景大纲:    从编程会话进入扩展诊断会话失败
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入扩展诊断会话，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为条件未满足

    例子:   寻址方式与禁止肯定响应组合
      | comm types      | SPRMB |
      | 以物理寻址方式的  | 假    |
      | 以功能寻址方式的  | 假    |
      | 以物理寻址方式的  | 真    |
      | 以功能寻址方式的  | 真    |

#### 引导程序否定响应用例 ####
  @DiagnosticSessionControl
  场景大纲:    诊断会话控制请求子功能参数不支持
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为非法值，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为子功能不支持

    例子:   寻址方式与禁止肯定响应组合
      | comm types      | SPRMB |
      | 以物理寻址方式的  | 假    |
      | 以功能寻址方式的  | 假    |
      | 以物理寻址方式的  | 真    |
      | 以功能寻址方式的  | 真    |

  @DiagnosticSessionControl
  场景大纲:    诊断会话控制请求报文长度错误
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为报文长度错误

    例子:   寻址方式
      | comm types      |
      | 以物理寻址方式的  |
      | 以功能寻址方式的  |

  @DiagnosticSessionControl
  场景大纲:    诊断会话控制请求超长
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，报文长度为1025个字节，参数Sub-Function为进入扩展诊断会话，禁止肯定响应位为<SPRMB>，其余字节填充0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为报文长度错误

    例子:   寻址方式与禁止肯定响应组合
      | comm types      | SPRMB |
      | 以物理寻址方式的  | 假    |
      | 以功能寻址方式的  | 假    |
      | 以物理寻址方式的  | 真    |
      | 以功能寻址方式的  | 真    |

  @DiagnosticSessionControl
  场景大纲:    从默认会话进入编程会话失败
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为默认会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入编程会话，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为条件未满足

    例子:   寻址方式与禁止肯定响应组合
      | comm types      | SPRMB |
      | 以物理寻址方式的  | 假    |
      | 以功能寻址方式的  | 假    |
      | 以物理寻址方式的  | 真    |
      | 以功能寻址方式的  | 真    |

  @DiagnosticSessionControl
  场景大纲:    从编程会话进入扩展诊断会话失败
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为编程会话
    假如    HUD当前安全访问状态为锁定
    当      CANBUS上有<comm types>诊断会话控制请求，参数Sub-Function为进入扩展诊断会话，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有诊断会话控制否定响应，参数NegativeResponseCode为条件未满足

    例子:   寻址方式与禁止肯定响应组合
      | comm types      | SPRMB |
      | 以物理寻址方式的  | 假    |
      | 以功能寻址方式的  | 假    |
      | 以物理寻址方式的  | 真    |
      | 以功能寻址方式的  | 真    |


