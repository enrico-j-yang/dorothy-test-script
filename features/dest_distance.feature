# -*- coding: utf-8 -*-
# language: zh-CN

功能: 目的地距离时间，下一个路口的距离
  ============================================
  到目的地距离、到达目的地剩余时间、下一个路口的距离

  @DestDistance
  场景:    显示目的地距离
    当      CANBUS上目的地距离值为2500km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为2500km
    而且    HUD显示到达目的地剩余时间为88h33m
    而且    HUD显示下一个路口的距离为2km

  @DestDistance
  场景:    显示目的地距离为带小数的公里数
    当      CANBUS上目的地距离值为10.5km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒
    那么    HUD显示目的地距离为10.5km
    而且    HUD显示到达目的地剩余时间为88h33m
    而且    HUD显示下一个路口的距离为2km

  @DestDistance
  场景:    显示目的地距离小于1公里，单位为米
    当      CANBUS上目的地距离值为500m
    而且    CANBUS上到达目的地剩余时间值为3m
    而且    CANBUS上下一个路口的距离值为0m

    而且    CANBUS上信号持续3秒
    那么    HUD显示目的地距离为500m
    而且    HUD显示到达目的地剩余时间为3m
    而且    HUD显示下一个路口的距离为0m

  @DestDistance
  场景:    显示目的地距离1公里外到1公里内
    当      CANBUS上目的地距离值为1.1km
    而且    CANBUS上到达目的地剩余时间值为3m
    而且    CANBUS上下一个路口的距离值为0m

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为1.1km
    而且    HUD显示到达目的地剩余时间为3m
    而且    HUD显示下一个路口的距离为0m

    当      CANBUS上速度在20秒内从1.1km减小到900m
    那么    HUD显示目的地距离为900m

  @DestDistance
  场景:    显示目的地距离1公里内到1公里外
    当      CANBUS上目的地距离值为900m
    而且    CANBUS上到达目的地剩余时间值为3m
    而且    CANBUS上下一个路口的距离值为0m

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为900m
    而且    HUD显示到达目的地剩余时间为3m
    而且    HUD显示下一个路口的距离为0m

    当      CANBUS上速度在20秒内从900m增加到1.1km
    那么    HUD显示目的地距离为1.1km

  @DestDistance
  场景:    显示目的地距离为最小值
    当      CANBUS上目的地距离值为0m
    而且    CANBUS上到达目的地剩余时间值为0m
    而且    CANBUS上下一个路口的距离值为0m

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为0m
    而且    HUD显示到达目的地剩余时间为0m
    而且    HUD显示下一个路口的距离为0m

  @DestDistance
  场景:    显示目的地距离为最大值
    当      CANBUS上目的地距离值为6553.4km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒
    那么    HUD显示目的地距离为6553.4km
    而且    HUD显示到达目的地剩余时间为88h33m
    而且    HUD显示下一个路口的距离为2km

  @DestDistance
  场景:    显示目的地距离为非法值
    当      CANBUS上目的地距离值为6553.5km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒
    那么    HUD不显示目的地距离

  @DestDistance
  场景:    显示目的地距离失效，使用最后一次的有效值显示
    当      CANBUS上目的地距离值为2500km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒
    那么    HUD显示目的地距离为2500km
    而且    HUD显示到达目的地剩余时间为88h33m
    而且    HUD显示下一个路口的距离为2km

    当      CANBUS上信号断开3秒
    那么    HUD显示目的地距离为2500km

  @DestTimeRemaining
  场景:    显示到达目的地剩余时间
    当      CANBUS上目的地距离值为2500km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为2500km
    而且    HUD显示到达目的地剩余时间为88h33m
    而且    HUD显示下一个路口的距离为2km

  @DestTimeRemaining
  场景:    显示到达目的地剩余时间为最小值
    当      CANBUS上到达目的地剩余时间值为0h0m
    而且    CANBUS上到达目的地剩余时间值为0m
    而且    CANBUS上下一个路口的距离值为0m

    而且    CANBUS上信号持续3秒
    那么    HUD显示到达目的地剩余时间为0h0m
    而且    HUD显示到达目的地剩余时间为0m
    而且    HUD显示下一个路口的距离为0m

  @DestTimeRemaining
  场景:    显示到达目的地剩余时间为最大值
    当      CANBUS上到达目的地剩余时间值为99h59m
    而且    CANBUS上目的地距离值为2500km
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为2500km
    那么    HUD显示到达目的地剩余时间为99h59m
    而且    HUD显示下一个路口的距离为2km

  @DestTimeRemaining
  场景:    显示到达目的地剩余时间为非法值
    当      CANBUS上到达目的地剩余时间值为255h255m
    而且    CANBUS上目的地距离值为2500km
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒
    那么    HUD不显示到达目的地剩余时间
    那么    HUD显示目的地距离为2500km
    而且    HUD显示下一个路口的距离为2km

  @DestTimeRemaining
  场景:    显示到达目的地剩余时间超过最大值但不为非法值
    当      CANBUS上到达目的地剩余时间值为100h61m
    而且    CANBUS上目的地距离值为2500km
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒
    那么    HUD不显示到达目的地剩余时间
    那么    HUD显示目的地距离为2500km
    而且    HUD显示下一个路口的距离为2km

  @DestTimeRemaining
  场景:    显示到达目的地剩余时间失效，使用最后一次的有效值显示
    当      CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上目的地距离值为2500km
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒
    那么    HUD显示到达目的地剩余时间为88h33m
    那么    HUD显示目的地距离为2500km
    而且    HUD显示下一个路口的距离为2km

    当      CANBUS上信号断开2秒
    那么    HUD显示到达目的地剩余时间为88h33m

  @DestTimeRemaining
  场景:    到达目的地剩余时间失效时间超过2.5秒
    当      CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上目的地距离值为2500km
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒
    那么    HUD显示到达目的地剩余时间为88h33m
    那么    HUD显示目的地距离为2500km
    而且    HUD显示下一个路口的距离为2km

    当      CANBUS上信号断开3秒
    那么    HUD不显示到达目的地剩余时间

  @NextCrossDistance
  场景:    显示下一个路口的距离
    当      CANBUS上目的地距离值为2500km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为2500km
    而且    HUD显示到达目的地剩余时间为88h33m
    而且    HUD显示下一个路口的距离为2km

  @NextCrossDistance
  场景:    显示下一个路口的距离为带小数的公里数
    当      CANBUS上下一个路口的距离值为1.513km
    当      CANBUS上目的地距离值为500m
    而且    CANBUS上到达目的地剩余时间值为3m

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为500m
    而且    HUD显示到达目的地剩余时间为3m
    那么    HUD显示下一个路口的距离为1.5km

  @NextCrossDistance
  场景:    显示下一个路口的距离小于1公里，单位为米
    当      CANBUS上目的地距离值为500m
    而且    CANBUS上到达目的地剩余时间值为3m
    当      CANBUS上下一个路口的距离值为500m

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为500m
    而且    HUD显示到达目的地剩余时间为3m
    那么    HUD显示下一个路口的距离为500m

  @NextCrossDistance
  场景:    显示下一个路口的距离1公里外到1公里内
    当      CANBUS上目的地距离值为500m
    而且    CANBUS上到达目的地剩余时间值为3m
    而且    CANBUS上下一个路口的距离值为1.1km

    那么    HUD显示目的地距离为500m
    而且    HUD显示到达目的地剩余时间为3m
    那么    HUD显示下一个路口的距离为1.1km

    当      CANBUS上下一个路口的距离在20秒内从1.1km减小到900m
    那么    HUD显示下一个路口的距离为900m

  @NextCrossDistance
  场景:    显示下一个路口的距离1公里内到1公里外
    当      CANBUS上目的地距离值为900m
    而且    CANBUS上到达目的地剩余时间值为3m
    而且    CANBUS上下一个路口的距离值为900m

    那么    HUD显示目的地距离为900m
    而且    HUD显示到达目的地剩余时间为3m
    那么    HUD显示下一个路口的距离为900m

    当      CANBUS上下一个路口的距离在20秒内从900m增加到1.1km
    那么    HUD显示下一个路口的距离为1.1km

  @NextCrossDistance
  场景:    显示下一个路口的距离为最小值
    当      CANBUS上目的地距离值为0m
    而且    CANBUS上到达目的地剩余时间值为0m
    而且    CANBUS上下一个路口的距离值为0m

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为0m
    而且    HUD显示到达目的地剩余时间为0m
    而且    HUD显示下一个路口的距离为0m

  @NextCrossDistance
  场景:    显示下一个路口的距离为最大值
    当      CANBUS上目的地距离值为6553.4km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为65.534km

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为6553.4km
    而且    HUD显示到达目的地剩余时间为88h33m
    而且    HUD显示下一个路口的距离为65.5km

  @NextCrossDistance
  场景:    显示下一个路口的距离为非法值
    当      CANBUS上目的地距离值为2500km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为65.535km

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为2500km
    而且    HUD显示到达目的地剩余时间为88h33m
    而且    HUD不显示下一个路口的距离

  @NextCrossDistance
  场景:    显示下一个路口的距离失效，使用最后一次的有效值显示
    当      CANBUS上目的地距离值为2500km
    而且    CANBUS上到达目的地剩余时间值为88h33m
    而且    CANBUS上下一个路口的距离值为2km

    而且    CANBUS上信号持续3秒

    那么    HUD显示目的地距离为2500km
    而且    HUD显示到达目的地剩余时间为88h33m
    而且    HUD显示下一个路口的距离为2km

    当      CANBUS上信号断开3秒
    那么    HUD显示下一个路口的距离为2km
    
        