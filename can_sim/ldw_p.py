# -- coding: utf-8 --
from can_sim.process import *


class LdwP(Processer):
    _operation_status_data = [
        (0, 'Off'),
        (1, 'Standby'),
        (2, 'Active'),
        (3, 'Fault'),
        (4, 'Calculation'),
        (5, 'Camera Cover'),
        (6, 'Reserve'),
        (7, 'Reserve2')
    ]
    _warning_status_data = [
        (0, 'No Display'),
        (1, 'Tracking'),
        (2, 'Reserved'),
        (3, 'Warning')
    ]
    _fault_status_data = [
        (0, 'No Fault'),
        (1, 'CAN Communication'),
        (2, 'Temporary Failure'),
        (3, 'Permanent Failure'),
        (4, 'Reserve')
    ]
    _calculation_status_data = [
        (0, 'Calibration Not Executed'),
        (1, 'Calibration In Process'),
        (2, 'Calibration Success'),
        (3, 'Calibration Failed')
    ]

    """车道偏离协议数据封装器"""
    def __init__(self):
        super().__init__(0x360)

    """
    第0个字节0~1位表示车道左偏离报警
    0 No display，1 Tracking(检测到车道)，2 reserved(保留)，3 Warning
    """
    def set_left_warning_status(self, status):
        self.set_data_bits_auto(0, 0, 1, [tup for tup in self._warning_status_data if tup[1] == status][0][0])

    """
    第0个字节2~3位表示车道右偏离报警
    0 No display，1 Tracking(检测到车道)，2 reserved(保留)，3 Warning
    """
    def set_right_warning_status(self, status):
        self.set_data_bits_auto(0, 2, 3, [tup for tup in self._warning_status_data if tup[1] == status][0][0])

    """
    第0个字节4~6位表示系统状态
    0x0: Off（系统关闭）
    0x1: Standby（系统待机）
    0x2: Active（系统激活）
    0x3: Fault（故障状态）
    0x4: Calculation（标定状态）
    0x5: camera cover(摄像头覆盖)（预留）
    0x6~0x7:Reserve（保留值）
    """
    def set_operation_status(self, status):
        self.set_data_bits_auto(0, 4, 6, [tup for tup in self._operation_status_data if tup[1] == status][0][0])

    """
    第1个字节完整表示故障类型
    0x0: No Fault
    0x1: CAN Communication（通讯丢失/错误
    0x2: temporary failure（临时故障）
    0x3: permanent failure（永久故障）
    0x4~0xF:Reserve
    """
    def set_fault_status(self, status):
        self.set_data_auto(1, [tup for tup in self._fault_status_data if tup[1] == status][0][0])

    """
    第2个字节0~1位表示校准状态
    0x0: Calibration Not Executed（未进行校正）
    0x1: Calibration In Process （校正中）
    0x2: Calibration Success（校正成功）
    0x3: Calibration Failed（校正失败）
    """
    def set_calculation_status(self, status):
        self.set_data_bits_auto(2, 0, 1, [tup for tup in self._calculation_status_data if tup[1] == status][0][0])


# ldw = LdwP()
# ldw.set_left_warning_status(3)
# ldw.set_right_warning_status(1)
# ldw.set_operation_status(2)
# ldw.set_fault_status(3)
# ldw.set_calculation_status(2)
# print(ldw.get_msg_id())
# print(ldw.get_data())
