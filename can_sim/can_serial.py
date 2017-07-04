from ctypes import *


class VCI_INIT_CONFIG(Structure):
    _fields_ = [
        ("AccCode", c_int),
        ("AccMask", c_int),
        ("Reserved", c_int),
        ("Filter", c_char),
        ("Timing0", c_char),
        ("Timing1", c_char),
        ("Mode", c_char)
    ]


class VCI_CAN_OBJ(Structure):
    _fields_ = [
        ("ID", c_int),
        ("TimeStamp", c_int),
        ("TimeFlag", c_byte),
        ("SendType", c_byte),
        ("RemoteFlag", c_byte),
        ("ExternFlag", c_byte),
        ("DataLen", c_byte),
        ("Data", c_byte * 8),
        ("Reserved", c_byte * 3)
    ]


class SerialPort(object):

    device_type = 20  # USBCAN-E-U
    device_index = 0  # 默认为0,只有一台设备接入PC
    can_index = 0  # 对应的CAN通道,默认为0

    dll = None
    log_control = None

    """docstring for SerialPort"""
    def __init__(self, log_control):
        super(SerialPort, self).__init__()
        self.log_control = log_control

    def open_serial(self):
        self.dll = windll.LoadLibrary("ControlCAN.dll")
        result = self.dll.VCI_OpenDevice(self.device_type, self.device_index, 0)
        if result == 0:
            self.log_control.add_log("打开设备失败")
            return 0
        else:
            self.log_control.add_log("打开设备成功")

        intPara = c_int(0x060007)  # 波特率500K
        bote = self.dll.VCI_SetReference(self.device_type, 0, 0, 0,
                                         byref(intPara))
        if bote == 0:
            self.log_control.add_log("设置波特率失败")
            return 0
        else:
            self.log_control.add_log("设置波特率成功")

        vci_init_config = VCI_INIT_CONFIG()
        vci_init_config.Mode = 0  # 正常模式
        init_status = self.dll.VCI_InitCAN(self.device_type, self.device_index,
                                           self.can_index,
                                           byref(vci_init_config))
        if init_status == 0:
            self.log_control.add_log("初始化设备失败")
            return 0
        else:
            self.log_control.add_log("初始化设备成功")

        start_status = self.dll.VCI_StartCAN(self.device_type,
                                             self.device_index,
                                             self.can_index)
        if start_status == 0:
            self.log_control.add_log("启动失败")
            return 0
        else:
            self.log_control.add_log("启动成功")
        return 1

    def close_serial(self):
        status = self.dll.VCI_CloseDevice(self.device_type, self.device_index)
        return status

    def send_data(self, msg_id, msg_data):
        vci_can_obj = VCI_CAN_OBJ()
        vci_can_obj.ID = msg_id
        vci_can_obj.SendType = 1  # 单次发送
        vci_can_obj.RemoteFlag = 0  # 数据帧
        vci_can_obj.ExternFlag = 0  # 标准帧
        vci_can_obj.DataLen = 8  # 数据长度8个字节
        # for i in range(0, len(vci_can_obj.Data)):
        #   vci_can_obj[i] = 0
        for i in range(0, 8):
            vci_can_obj.Data[i] = msg_data[i]
        # send_status = 1
        send_status = self.dll.VCI_Transmit(self.device_type,
                                            self.device_index,
                                            self.can_index,
                                            byref(vci_can_obj), 1)
        #print("发送状态%d--%s" % (send_status, msg_data))
        return send_status
