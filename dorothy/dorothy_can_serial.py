from ctypes import *
from can_sim.can_serial import SerialPort as CanSerialPort


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


class SerialPort(CanSerialPort):
    mock_enable = False
    send_mock = False

    """docstring for SerialPort"""

    def __init__(self, log_control, mock_enable=False, send_mock=False):
        super(SerialPort, self).__init__(log_control)
        self.log_control = log_control
        self.mock_enable = mock_enable
        self.send_mock = send_mock

    def open_serial(self):
        if self.mock_enable:
            return 1
        else:
            return super(SerialPort, self).open_serial()

    def close_serial(self):
        if self.mock_enable:
            return 1
        else:
            return super(SerialPort, self).close_serial()

    def send_data(self, msg_id, msg_data):
        if self.mock_enable:
            return 1
        else:
            vci_can_obj = VCI_CAN_OBJ()
            vci_can_obj.ID = msg_id
            if not self.send_mock:
                vci_can_obj.SendType = 1  # 单次发送
            else:
                vci_can_obj.SendType = 2  # 自发自收
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
            # print("发送状态%d--%s" % (send_status, msg_data))
        return send_status
