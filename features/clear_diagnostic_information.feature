# Created by enrico at 16/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 清除诊断信息
  ============================================
  清除诊断信息

#### 肯定响应用例 ####
  @ClearDiagnosticInformation
  场景大纲:    清除车身组诊断信息成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前有电路电压低于门槛值的诊断信息

    当      CANBUS上有<comm types>清除诊断信息请求，参数GroupOfDTC为车身组
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息肯定响应

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ClearDiagnosticInformation
  场景大纲:    清除所有组诊断信息成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前有电路电压低于门槛值的诊断信息
    当      CANBUS上有<comm types>清除诊断信息请求，参数GroupOfDTC为所有组
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息肯定响应

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

#### 否定响应用例 ####
  @ClearDiagnosticInformation
  场景大纲:    清除排放相关系统诊断信息失败
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前有电路电压低于门槛值的诊断信息
    当      CANBUS上有<comm types>清除诊断信息请求，参数GroupOfDTC为排放相关系统
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为条件未满足

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ClearDiagnosticInformation
  场景大纲:    清除动力组诊断信息失败
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前有电路电压低于门槛值的诊断信息
    当      CANBUS上有<comm types>清除诊断信息请求，参数GroupOfDTC为动力组
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为条件未满足

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ClearDiagnosticInformation
  场景大纲:    清除底盘组诊断信息失败
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前有电路电压低于门槛值的诊断信息
    当      CANBUS上有<comm types>清除诊断信息请求，参数GroupOfDTC为底盘组
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为条件未满足

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ClearDiagnosticInformation
  场景大纲:    清除网络通信组诊断信息失败
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前有电路电压低于门槛值的诊断信息
    当      CANBUS上有<comm types>清除诊断信息请求，参数GroupOfDTC为网络通信组
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为条件未满足

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ClearDiagnosticInformation
  场景大纲:    清除所有组诊断信息请求报文长度错误
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前有电路电压低于门槛值的诊断信息
    当      CANBUS上有<comm types>清除诊断信息请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为报文长度错误

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ClearDiagnosticInformation
  场景大纲:    清除所有组诊断信息请求报文超长
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前有电路电压低于门槛值的诊断信息
    当      CANBUS上有<comm types>清除诊断信息请求，报文长度为1025个字节，参数GroupOfDTC为所有组，其余字节填充0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为报文长度错误

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ClearDiagnosticInformation
  场景大纲:    清除所有组诊断信息请求请求超出范围
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD当前有电路电压低于门槛值的诊断信息
    当      CANBUS上有<comm types>清除诊断信息请求，参数GroupOfDTC为非法值0xE00000
    而且    CANBUS上信号发送一次

    那么    CANBUS上有清除诊断信息否定响应，参数NegativeResponseCode为请求超出范围

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |