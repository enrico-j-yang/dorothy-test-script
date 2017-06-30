# Created by enrico at 21/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 例程控制
  ============================================
  例程控制

#### 肯定响应用例 ####
  @RoutineControl, @wip
  场景大纲:    例程控制请求开始例程成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制肯定响应，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineStatusrecord为？？

    例子:   例程控制请求开始例程用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |

  @RoutineControl, @wip
  场景大纲:    例程控制请求停止例程成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前例程控制状态为已开始

    当      CANBUS上有以物理寻址方式的例程控制请求，参数RoutineControlType为停止例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制肯定响应，参数RoutineControlType为停止例程，参数RoutineIdentifier为？？，参数RoutineStatusrecord为？？

    例子:   例程控制请求开始例程用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |

  @RoutineControl, @wip
  场景大纲:    例程控制请求请求例程结果成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前例程控制状态为已结束

    当      CANBUS上有以物理寻址方式的例程控制请求，参数RoutineControlType为停止例程，参数RoutineIdentifier为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制肯定响应，参数RoutineControlType为请求例程结果，参数RoutineIdentifier为？？，参数RoutineStatusrecord为？？

    例子:   例程控制请求请求例程结果用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |

#### 否定响应用例 ####
  @RoutineControl, @wip
  场景大纲:    例程控制请求不支持子功能
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的例程控制请求，参数RoutineControlType为0xFF，参数RoutineIdentifier为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为不支持子功能

    例子:   例程控制请求不支持子功能用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |

  @RoutineControl, @wip
  场景大纲:    例程控制请求报文长度只有1个字节
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的例程控制请求，报文长度为1个字节
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   例程控制请求报文长度只有1个字节用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |

  @RoutineControl, @wip
  场景大纲:    例程控制请求报文长度只有2个字节
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的例程控制请求，报文长度为2个字节，参数RoutineControlType为启动例程
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   例程控制请求报文长度只有2个字节用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |

  @RoutineControl, @wip
  场景大纲:    例程控制请求报文长度只有3个字节
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的例程控制请求，报文长度为3个字节，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   例程控制请求报文长度只有3个字节用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |

  @RoutineControl, @wip
  场景大纲:    例程控制请求条件不满足
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为条件不满足

    例子:   例程控制请求条件不满足用例
      | session environment | session mode |
      | 应用程序             | 默认会话      |
      | 应用程序             | 默认会话      |
      | 应用程序             | 编程会话      |
      | 应用程序             | 编程会话      |
      | 引导程序             | 默认会话      |
      | 引导程序             | 默认会话      |

  @RoutineControl, @wip
  场景大纲:    例程控制请求序列错误
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前例程控制状态为已结束

    当      CANBUS上有以物理寻址方式的例程控制请求，参数RoutineControlType为结束例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为请求序列错误

    例子:   例程控制请求序列错误用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |

  @RoutineControl, @wip
  场景大纲:    例程控制请求ECU 不支持被请求的例程标识
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为请求数据超出范围

    例子:   例程控制请求ECU 不支持被请求的例程标识用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |

  @RoutineControl, @wip
  场景大纲:    例程控制请求对于被请求例程标识符，用户选择的例程控制选项记录包含无效数据
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为请求数据超出范围

    例子:   例程控制请求对于被请求例程标识符，用户选择的例程控制选项记录包含无效数据用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |

  @RoutineControl, @wip
  场景大纲:    例程控制请求安全访问拒绝
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为安全访问拒绝

    例子:   例程控制请求安全访问拒绝用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |

  @RoutineControl, @wip
  场景大纲:    例程控制请求一般编程错误
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定

    当      CANBUS上有以物理寻址方式的例程控制请求，参数RoutineControlType为启动例程，参数RoutineIdentifier为？？，参数RoutineControlOptionRecord为？？
    而且    CANBUS上信号发送1次

    那么    CANBUS上有例程控制否定响应，参数NegativeResponseCode为一般编程错误

    例子:   例程控制请求一般编程错误用例
      | session environment | session mode |
      | 应用程序             | 扩展诊断会话   |
      | 应用程序             | 扩展诊断会话   |
      | 引导程序             | 编程会话      |
      | 引导程序             | 编程会话      |
      | 引导程序             | 扩展诊断会话   |
      | 引导程序             | 扩展诊断会话   |


