# Created by enrico at 19/06/2017
# -*- coding: utf-8 -*-
# language: zh-CN

功能: 读取DTC信息
  ============================================
  读取DTC信息数目，读取DTC信息列表和状态，控制DTC设置

#### 肯定响应用例 ####
  @ReadDTCInformation
  场景大纲:    读取 DTC 信息 – 通过状态掩码报告所有ISO15031-6DTCFormat格式 DTC 数目成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息 – 通过状态掩码报告所有ISO14229-1DTCFormat格式 DTC 数目成功大纲
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO14229-1DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x01，参数DTCCount为0x0001

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息 – 通过状态掩码报告单个 DTC 数目成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x01
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x01，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation, @wip
  场景大纲:    读取 DTC 信息 – 通过0x00状态掩码报告 DTC 数目成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x00，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001？？

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息 – 通过状态掩码报告 DTC 最大数目成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    当      HUD上电路电压高于门槛值
    而且    HUD上的电路电压高于门槛值持续1秒

    当      HUD上TFT屏温度高于门槛值
    而且    HUD上的TFT屏高温持续1秒

    当      HUD上Combiner移动受阻
    而且    HUD上的Combiner移动受阻持续4秒

    当      HUD上Covert移动受阻
    而且    HUD上的Covert移动受阻持续4秒

    当      HUD上EMS 节点报文超时
    而且    HUD上的EMS 节点报文超时持续1秒

    当      HUD上FBCM 节点报文超时
    而且    HUD上的FBCM 节点报文超时持续2秒

    当      HUD上IC 节点报文超时
    而且    HUD上的IC 节点报文超时持续2秒

    当      HUD上DVD 节点报文超时
    而且    HUD上的DVD 节点报文超时持续2秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x09

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息 – 通过状态掩码报告1个DTC成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0xFF，参数DTCAndStatusRecord为0x91171604

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息 – 通过状态掩码报告多个DTC成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    当      HUD上电路电压高于门槛值
    而且    HUD上的高压持续1秒

    当      HUD上TFT屏温度高于门槛值
    而且    HUD上的TFT屏高温持续1秒

    当      HUD上Combiner移动受阻
    而且    HUD上的Combiner移动受阻持续4秒

    当      HUD上Covert移动受阻
    而且    HUD上的Covert移动受阻持续4秒

    当      HUD上EMS 节点报文超时
    而且    HUD上的EMS 节点报文超时持续1秒

    当      HUD上FBCM 节点报文超时
    而且    HUD上的FBCM 节点报文超时持续2秒

    当      HUD上IC 节点报文超时
    而且    HUD上的IC 节点报文超时持续2秒

    当      HUD上DVD 节点报文超时
    而且    HUD上的DVD 节点报文超时持续2秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x09

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0xFF，参数DTCAndStatusRecord为0xC2558704C2548704C2538704C1468704911720049117190491171804911717040491171604

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息 – 报告支持的 DTC 成功
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    当      HUD上电路电压高于门槛值
    而且    HUD上的高压持续1秒

    当      HUD上TFT屏温度高于门槛值
    而且    HUD上的TFT屏高温持续1秒

    当      HUD上Combiner移动受阻
    而且    HUD上的Combiner移动受阻持续4秒

    当      HUD上Covert移动受阻
    而且    HUD上的Covert移动受阻持续4秒

    当      HUD上EMS 节点报文超时
    而且    HUD上的EMS 节点报文超时持续1秒

    当      HUD上FBCM 节点报文超时
    而且    HUD上的FBCM 节点报文超时持续2秒

    当      HUD上IC 节点报文超时
    而且    HUD上的IC 节点报文超时持续2秒

    当      HUD上DVD 节点报文超时
    而且    HUD上的DVD 节点报文超时持续2秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为报告支持的 DTC
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为报告支持的 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2558704C2548704C2538704C14687049117200491171904911718049117170491171604

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    CANBUS总线关闭故障恢复
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    当      HUD上CANBUS总线关闭
    而且    CANBUS总线关闭持续0.25秒

    当      HUD上CANBUS总线打开
    而且    CANBUS总线关闭持续0.05秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC0730004

    当      HUD上CANBUS总线打开
    而且    CANBUS总线关闭持续0.2秒

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC0730000

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    EMS 节点报文超时故障恢复
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上EMS 节点报文超时
    而且    HUD上的EMS 节点报文超时持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC1468704

    当      HUD上EMS 节点报文恢复正常
    而且    HUD上EMS 节点报文持续1秒

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC1468700

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    FBCM 节点报文超时故障恢复
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上FBCM 节点报文超时
    而且    HUD上的FBCM 节点报文超时持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2538704

    当      HUD上FBCM 节点报文恢复正常
    而且    HUD上FBCM 节点报文持续1秒

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2538700

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    IC 节点报文超时故障恢复
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上IC 节点报文超时
    而且    HUD上的IC 节点报文超时持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2548704

    当      HUD上IC 节点报文恢复正常
    而且    HUD上IC 节点报文持续1秒

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2548700

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    DVD 节点报文超时故障恢复
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上DVD 节点报文超时
    而且    HUD上的DVD 节点报文超时持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2558704

    当      HUD上DVD 节点报文恢复正常
    而且    HUD上DVD 节点报文持续1秒

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0xC2558700

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    低电压异常故障恢复
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171604

    当      HUD上电路电压恢复正常
    而且    HUD上的电路电压持续1秒

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171600

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    高电压异常故障恢复
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压高于门槛值
    而且    HUD上的电路电压高于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171704

    当      HUD上电路电压恢复正常
    而且    HUD上的电路电压持续1秒

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171700

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    TFT屏高温保护故障恢复
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上TFT屏温度高于门槛值
    而且    HUD上的TFT屏温度高于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171804

    当      HUD上TFT屏温度恢复正常
    而且    HUD上的TFT屏温度持续1秒

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171800

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    Combiner移动受阻故障恢复
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上Combiner移动受阻
    而且    HUD上的Combiner移动受阻持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171904

    当      HUD上Combiner移动恢复正常
    而且    HUD上的Combiner移动持续1秒

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91171900

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    Covert移动受阻故障恢复
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上Covert移动受阻
    而且    HUD上的Covert移动受阻持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91172004

    当      HUD上Covert移动恢复正常
    而且    HUD上的Covert移动持续1秒

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0x04，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0x04
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0x04，参数DTCAndStatusRecord为0x91172000

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

#### 否定响应用例 ####
  @ReadDTCInformation
  场景大纲:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文只有请求名称
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文只有请求名称和子功能
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，报文长度为2个字节，参数Sub-Function为通过状态掩码报告DTC数目
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文只有请求名称和子功能
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，报文长度为2个字节，参数Sub-Function为通过状态掩码报告 DTC
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息 – 通过状态掩码报告 DTC 数目请求报文长度超长
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，报文长度为1025个字节，参数Sub-Function为0xFF，参数DTCStatusMask为0xFF，其余字节填充0x00
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息请求子功能不支持
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为0xFF，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为子功能不支持

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息请求子功能不支 持通过DTC码报告DTCSnapshot记录
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过DTC码报告DTCSnapshot记录，参数DTCMaskRecord为0xFFFFFF，参数DTCSnapshotRecordNumber为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为子功能不支持

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

  @ReadDTCInformation
  场景大纲:    读取 DTC 信息请求子功能不支持 通过 DTC 码报告 DTC 扩展数据记录
    假如    HUD当前诊断模式运行环境为应用程序
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过DTC码报告DTC扩展数据记录，参数DTCMaskRecord为0xFFFFFF，参数DTCExtendedDataRecordNumber为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取DTC信息否定响应，参数NegativeResponseCode为子功能不支持

    例子:   寻址方式
      | comm types      | session mode  |
      | 以物理寻址方式的  | 默认会话       |
      | 以功能寻址方式的  | 默认会话       |
      | 以物理寻址方式的  | 扩展诊断会话    |
      | 以功能寻址方式的  | 扩展诊断会话    |

#### 肯定响应用例 ####
  @ControlDTCSetting
  场景大纲:    控制DTC设置打开成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      CANBUS上有<comm types>控制DTC设置请求，参数DTCSettingType为打开，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置肯定响应，参数DTCSettingType为打开

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0xFF，参数DTCAndStatusRecord为0x91171604

    例子:   控制DTC设置打开用例
      | session environment | session mode | comm types      |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 编程会话      | 以物理寻址方式的  |
      | 引导程序             | 编程会话      | 以功能寻址方式的  |

  @ControlDTCSetting
  场景大纲:    控制DTC设置关闭成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      CANBUS上有<comm types>控制DTC设置请求，参数DTCSettingType为关闭，禁止肯定响应位为假
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置肯定响应，参数DTCSettingType为关闭

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0xFF，参数DTCAndStatusRecord为0x91171600

    例子:   控制DTC设置打开用例
      | session environment | session mode | comm types      |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 编程会话      | 以物理寻址方式的  |
      | 引导程序             | 编程会话      | 以功能寻址方式的  |

  @ControlDTCSetting
  场景大纲:    控制DTC设置打开成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      CANBUS上有<comm types>控制DTC设置请求，参数DTCSettingType为打开，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0001

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0xFF，参数DTCAndStatusRecord为0x91171604

    例子:   控制DTC设置打开用例
      | session environment | session mode | comm types      |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 编程会话      | 以物理寻址方式的  |
      | 引导程序             | 编程会话      | 以功能寻址方式的  |

  @ControlDTCSetting
  场景大纲:    控制DTC设置关闭成功
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    当      CANBUS上有<comm types>控制DTC设置请求，参数DTCSettingType为关闭，禁止肯定响应位为真
    而且    CANBUS上信号发送一次

    当      HUD上电路电压低于门槛值
    而且    HUD上的电路电压低于门槛值持续1秒

    假如    HUD上有ISO15031-6DTCFormat格式DTC信息
    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告DTC数目，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告DTC数目，参数DTCStatusAvailabilityMask为0xFF，参数DTCFormatIdentifier为0x00，参数DTCCount为0x0000

    当      CANBUS上有<comm types>读取DTC信息请求，参数Sub-Function为通过状态掩码报告 DTC，参数DTCStatusMask为0xFF
    而且    CANBUS上信号发送一次

    那么    CANBUS上有读取 DTC 信息肯定响应，参数ReportType为通过状态掩码报告 DTC，参数DTCStatusAvailabilityMask为0xFF，参数DTCAndStatusRecord为0x91171600

    例子:   控制DTC设置打开用例
      | session environment | session mode | comm types      |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 编程会话      | 以物理寻址方式的  |
      | 引导程序             | 编程会话      | 以功能寻址方式的  |

#### 否定响应用例 ####
  @ControlDTCSetting
  场景大纲:    控制DTC设置，响应不支持子功能
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有<comm types>控制DTC设置请求，参数DTCSettingType为0x00，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置否定响应，参数NegativeResponseCode为不支持子功能

    例子:   控制DTC设置，响应不支持子功能用例
      | session environment | session mode | comm types      | SPRMB |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 假    |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 假    |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 假    |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 假    |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 假    |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 假    |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 真    |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 真    |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 真    |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 真    |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 真    |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 真    |

  @ControlDTCSetting
  场景大纲:    控制DTC设置，报文只有RequestServiceIdentifier
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有<comm types>控制DTC设置请求，报文长度为1个字节
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   控制DTC设置，报文只有RequestServiceIdentifier用例
      | session environment | session mode | comm types      |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  |
      | 引导程序             | 编程会话      | 以物理寻址方式的  |
      | 引导程序             | 编程会话      | 以功能寻址方式的  |

  @ControlDTCSetting
  场景大纲:    控制DTC设置，报文长度超长
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有<comm types>控制DTC设置请求，报文长度为1025个字节，参数DTCSettingType为打开，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置否定响应，参数NegativeResponseCode为报文长度错误或者格式非法

    例子:   控制DTC设置，报文长度超长用例
      | session environment | session mode | comm types      | SPRMB |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 假    |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 假    |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 假    |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 假    |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 假    |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 假    |
      | 应用程序             | 扩展诊断会话   | 以物理寻址方式的  | 真    |
      | 应用程序             | 扩展诊断会话   | 以功能寻址方式的  | 真    |
      | 引导程序             | 扩展诊断会话   | 以物理寻址方式的  | 真    |
      | 引导程序             | 扩展诊断会话   | 以功能寻址方式的  | 真    |
      | 引导程序             | 编程会话      | 以物理寻址方式的  | 真    |
      | 引导程序             | 编程会话      | 以功能寻址方式的  | 真    |
  @ControlDTCSetting
  场景大纲:    控制DTC设置，如果 ECU 处于正常模式临界状态而不能执行被请求的诊断故障码控制功能，响应条件不满足
    假如    HUD当前诊断模式运行环境为<session environment>
    假如    HUD当前诊断会话模式为<session mode>
    假如    HUD当前安全访问状态为锁定
    假如    HUD上EMS 节点报文正常
    假如    HUD上FBCM 节点报文正常
    假如    HUD上IC 节点报文正常
    假如    HUD上DVD 节点报文正常
    假如    HUD上电路电压正常
    假如    HUD上TFT屏温度正常
    假如    HUD上Combiner移动正常
    假如    HUD上Covert移动正常

    假如    HUD当前诊断会话模式为默认会话
    当      CANBUS上有<comm types>控制DTC设置请求，参数DTCSettingType为打开，禁止肯定响应位为<SPRMB>
    而且    CANBUS上信号发送一次

    那么    CANBUS上有控制DTC设置否定响应，参数NegativeResponseCode为条件不满足

    例子:   控制DTC设置，如果 ECU 处于正常模式临界状态而不能执行被请求的诊断故障码控制功能，响应条件不满足用例
      | session environment | session mode | comm types      | SPRMB |
      | 应用程序             | 默认会话      | 以物理寻址方式的  | 假    |
      | 应用程序             | 默认会话      | 以功能寻址方式的  | 假    |
      | 应用程序             | 编程会话      | 以物理寻址方式的  | 假    |
      | 应用程序             | 编程会话      | 以功能寻址方式的  | 假    |
      | 引导程序             | 默认会话      | 以物理寻址方式的  | 假    |
      | 引导程序             | 默认会话      | 以功能寻址方式的  | 假    |
      | 应用程序             | 默认会话      | 以物理寻址方式的  | 真    |
      | 应用程序             | 默认会话      | 以功能寻址方式的  | 真    |
      | 应用程序             | 编程会话      | 以物理寻址方式的  | 真    |
      | 应用程序             | 编程会话      | 以功能寻址方式的  | 真    |
      | 引导程序             | 默认会话      | 以物理寻址方式的  | 真    |
      | 引导程序             | 默认会话      | 以功能寻址方式的  | 真    |


