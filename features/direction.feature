# -*- coding: utf-8 -*-
# language: zh-CN

功能: 到下一个路口的进度，转向路口类型，指北针角度
  ============================================
  到下一个路口的进度、转向路口类型、指北针角度

  @NextCrossProgress
  场景:    到下一个路口的进度
    当      CANBUS上到下一个路口的进度值为50%
    当      CANBUS上转向路口类型为0
    当      CANBUS上指北针角度为0

    而且    CANBUS上信号持续3秒

    那么    HUD显示到下一个路口的进度值为50%
    那么    HUD显示指北针方向为北

  @NextCrossProgress
  场景:    到下个一路口的进度从100%到0%
    当      CANBUS上到下一个路口的进度值为100%
    当      CANBUS上指北针角度为0

    而且    CANBUS上到下一个路口的进度值在10秒内从100%下降到0%

    那么    HUD显示到下一个路口的进度值在10秒内从100%下降到0%
    那么    HUD显示指北针方向为北

  @NextCrossProgress
  场景:    显到下一个路口的进度最小值
    当      CANBUS上到下一个路口的进度值为0%
    当      CANBUS上指北针角度为0

    而且    CANBUS上信号持续3秒

    那么    HUD显示到下一个路口的进度值为0%
    那么    HUD显示指北针方向为北

  @NextCrossProgress
  场景:    到下一个路口的进度为最大值
    当      CANBUS上到下一个路口的进度值为100%
    当      CANBUS上指北针角度为0

    而且    CANBUS上信号持续3秒

    那么    HUD显示到下一个路口的进度值为100%
    那么    HUD显示指北针方向为北

  @NextCrossProgress
  场景:    到下一个路口的进度为非法值
    当      CANBUS上到下一个路口的进度值为255%
    当      CANBUS上指北针角度为0

    而且    CANBUS上信号持续3秒

    那么    HUD不显示到下一个路口的进度
    那么    HUD显示指北针方向为北

  @NextCrossProgress
  场景:    到下一个路口的进度超过最大值但不为非法值
    当      CANBUS上到下一个路口的进度值为101%
    当      CANBUS上指北针角度为0

    而且    CANBUS上信号持续3秒

    那么    HUD不显示到下一个路口的进度
    那么    HUD显示指北针方向为北

  @NextCrossProgress
  场景:    到下一个路口的进度失效，使用最后一次的有效值显示
    当      CANBUS上到下一个路口的进度值为50%
    当      CANBUS上指北针角度为0

    而且    CANBUS上信号持续3秒
    那么    HUD显示到下一个路口的进度值为50%
    那么    HUD显示指北针方向为北

    当      CANBUS上信号断开2秒
    那么    HUD显示到下一个路口的进度值为50%

  @NextCrossProgress
  场景:    到下一个路口的进度失效时间超过2.5秒
    当      CANBUS上到下一个路口的进度值为50%
    当      CANBUS上指北针角度为0

    而且    CANBUS上信号持续3秒
    那么    HUD显示到下一个路口的进度值为50%
    那么    HUD显示指北针方向为北

    当      CANBUS上信号断开3秒
    那么    HUD不显示到下一个路口的进度

  @Compass
  场景大纲:   指北针方向显示为北
    当      CANBUS上指北针角度为<angle>
    当      CANBUS上到下一个路口的进度值为50%

    而且    CANBUS上信号持续3秒

    那么    HUD显示指北针方向为<direction>
    那么    HUD显示到下一个路口的进度值为50%

    例子:   指北针角度与方向关系
      | angle | direction |
      | 0     | 北         |
      | 90    | 西         |
      | 180   | 南         |
      | 270   | 东         |
      | 45    | 西北        |
      | 135   | 西南        |
      | 225   | 东南        |
      | 315   | 东北        |
      | 1     | 西北        |
      | 89    | 西北        |
      | 91    | 西南        |
      | 179   | 西南        |
      | 181   | 东南        |
      | 269   | 东南        |
      | 271   | 东北        |
      | 359   | 东北        |

  @Compass
  场景:    指北针失效，使用最后一次的有效值显示
    当      CANBUS上指北针角度为0
    当      CANBUS上到下一个路口的进度值为50%

    而且    CANBUS上信号持续3秒

    那么    HUD显示指北针方向为北
    那么    HUD显示到下一个路口的进度值为50%

    当      CANBUS上信号断开2秒
    那么    HUD显示指北针方向为北

    当      CANBUS上指北针角度为180
    而且    CANBUS上信号持续3秒

    那么    HUD显示指北针方向为南

  @Compass
  场景:    指北针失效时间超过2.5秒
    当      CANBUS上指北针角度为0
    当      CANBUS上到下一个路口的进度值为50%

    而且    CANBUS上信号持续3秒

    那么    HUD显示指北针方向为北
    那么    HUD显示到下一个路口的进度值为50%

    当      CANBUS上信号断开3秒
    那么    HUD显示指北针图标消失

  @Compass
  场景:    指北针值为非法值
    当      CANBUS上指北针角度为65535
    当      CANBUS上到下一个路口的进度值为50%

    而且    CANBUS上信号持续3秒

    那么    HUD显示指北针图标消失
    那么    HUD显示到下一个路口的进度值为50%
        
        