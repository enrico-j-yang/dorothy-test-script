# -- coding: utf-8 --
from can_sim.process import *
import copy


class NavigationP(Processer):

    """时速协议数据封装器"""
    def __init__(self):
        super().__init__(0x333)
        # 第0个字节4~7位为0x07表示该信息是导航信息
        self.set_data_bits_auto(0, 4, 7, 7)

    """
    第0个字节0~3位为0表示无状态
    无状态时重置所有字节的数据
    """
    def clear_data(self):
        self.set_data_bits_auto(0, 0, 3, 0)
        for i in range(1, 8):
            self.set_data_auto(i, 0)

    """
    第0个字节0~3位为1表示导航距离和时间等信息
    dt_distance     第2~3个字节表示到目的地距离(公里为单位,分辨率是0.1公里,当前数值=实际距离*10)
    dt_hours        第4个字节表示到达目的地剩余时间:小时,16进制
    dt_minutes      第5个字节表示到达目的地剩余时间:分钟,16进制
    ncr_distance    第6~7个字节表示下一个路口的距离(两个字节,精确到1米,当前数值=实际距离)

    dt = destination 目的地
    ncr = next crossroad 下一个路口
    """
    def set_nav_distance_and_time(self, dt_distance, dt_hours,
                                  dt_minutes, ncr_distance):
        self.clear_data()
        self.set_data_bits_auto(0, 0, 3, 1)
        self.set_data_bytes_auto(2, 3, dt_distance)
        self.set_data_auto(4, dt_hours)
        self.set_data_auto(5, dt_minutes)
        self.set_data_bytes_auto(6, 7, ncr_distance)
        return self.get_data()

    """
    第0个字节0~3位为2表示导航下一个路口进度路口类型指北针角度等信息
    ncr_progress    第2个字节表示到下一个路口的进度(一个字节,0~100%)
    ncr_type        第3个字节表示到转向路口类型
    angle           第4~5个字节表示指北针角度,以北为0度,0~360度,逆时针角度,如90度对应为正西方向

    ncr = next crossroad 下一个路口
    """
    def set_nav_crossroad_and_angle(self, ncr_progress, ncr_type, angle):
        self.clear_data()
        self.set_data_bits_auto(0, 0, 3, 2)
        self.set_data_auto(2, ncr_progress)
        self.set_data_auto(3, ncr_type)
        self.set_data_bytes_auto(4, 5, angle)
        return self.get_data()

    """
    第0个字节0~3位为3表示当前道路名称
    第1个字节5~7位为0表示清除当前道路名称
    """
    def clear_nav_road(self):
        self.clear_data()
        self.set_data_bits_auto(0, 0, 3, 3)

    """
    第0个字节0~3位为3表示当前道路名称
    第1个字节5~7位分别是起始包001,连续包010,结束包011
    number  第1个字节0~4位是包的连续帧号,值为参数number,取值范围从1~10
    is_end  表示这个包是否为结束包
    name    第2~3,4~5,6~7字节分别表示3个字符或汉字

    如果只有1个包,第1个字节5~7位依然应该设置起始包001
    (特殊情况,只有1个起始包001,并且路名少于3个字,末尾依然设置0xFFFF)
    无论多少个包，最后一个结束包011末尾都要设置0xFFFF
    """
    def set_nav_road(self, number, is_end, name):
        if len(name) > 3:
            raise Exception("单个包路名数据超载")
        if is_end and len(name) > 2:
            raise Exception("结束包不能超过2个字符或汉字")

        self.clear_data()
        self.set_data_bits_auto(0, 0, 3, 3)
        # 如果是包序号是1,则为起始包
        if number == 1:
            self.set_data_bits_auto(1, 5, 7, 1)
        else:
            # 如果包序号不为1,通过参数is_end判断是否为结束包
            if is_end:
                self.set_data_bits_auto(1, 5, 7, 3)
            else:
                self.set_data_bits_auto(1, 5, 7, 2)

        self.set_data_bits_auto(1, 0, 4, number)

        # 每个字或字符单独转成十六进制并存入
        for i in range(0, len(name)):
            start_byte = (i + 1) * 2
            end_byte = start_byte + 1
            part_name = name[i:i + 1]
            self.set_data_bytes_auto(start_byte, end_byte,
                                     self.chinese_to_hex(part_name))

        # 结束包结尾加上0xFFFF
        if is_end:
            start_byte = (len(name) + 1) * 2
            end_byte = start_byte + 1
            self.set_data_bytes_auto(start_byte, end_byte, 0xFFFF)
        return self.get_data()

    """
    设置导航路名,返回数据包数组
    """
    def set_nav_road_names(self, name):
        package = []
        # 路名3个分一组数据包,记录总共有需要多少组数据包
        name_size = len(name) / 3 + 1
        for i in range(0, int(name_size)):
            # 每个字放入的起始字节位和结束字节位
            s_index = i * 3
            e_index = len(name) if s_index + 3 > len(name) else s_index + 3
            part_name = name[s_index:e_index]
            # 如果e_index < s_index + 3 则该数据包为结束包
            data = self.set_nav_road(i + 1, e_index < s_index + 3, part_name)

            # 深复制整个元组,否则list数据会在下一个数据包被覆盖
            package.append(copy.deepcopy(data))
        return package

    """
    第0个字节0~3位为4表示电子眼信息
    cam_speed_limit     第3个字节完整表示电子眼限速
    cam_type            第4个字节4~7位表示电子眼类型
    dest_dist           第5个字节 + 第4个字节0~3位表示电子眼距离
    """
    def set_nav_e_dog(self, cam_speed_limit, cam_type, dest_dist):
        self.clear_data()
        self.set_data_bits_auto(0, 0, 3, 4)
        self.set_data_bits_auto(1, 5, 7, 4)
        self.set_data_auto(3, cam_speed_limit)
        self.set_data_bits_auto(4, 4, 7, cam_type)
        dist_high4 = (dest_dist & 0xf00) >> 8
        dist_low8 = dest_dist & 0xff
        self.set_data_bits_auto(4, 0, 3, dist_high4)
        self.set_data_auto(5, dist_low8)
        return self.get_data()


# nav = NavigationP()
# nav.clear_data()
# print("数据清空:%s" % nav.get_data())

# # 距离目的地300公里,需要3小时20分钟到达目的地,距离下一个路口2000米
# data = nav.set_nav_distance_and_time(300, 3, 20, 2000)
# print("导航距离时间:%s" % data)

# # 设置导航路口进度95%/路口类型1/指北针角度350°
# data = nav.set_nav_crossroad_and_angle(95, 1, 350)
# print("导航进度等:%s" % data)

# # 设置当前路名,自动分包
# data = nav.set_nav_road_names("华软test路建设路段")
# print("当前路名:%s" % data)
# for i in range(0, len(data)):
#     print(data[i])

# # 设置电子眼
# print(nav.set_nav_e_dog(130, 5, 4000))
