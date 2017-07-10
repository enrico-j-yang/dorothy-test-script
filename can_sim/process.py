# -- coding: utf-8 --


class Processer:

    # 报文标识符
    msg_id = 0
    # 报文8个字节可操作数据
    elements = 0
    # 最终生成bytesArray数组数据
    data = 0

    """docstring for Processer"""
    def __init__(self, msg_id):
        self.msg_id = msg_id
        self.elements = [0] * 8
        self.data = 0

    """
    设置整个字节的数据
    index       数据所在字节位, 取值范围0~7
    data        数据内容, 取值范围0~255
    """
    def set_data_auto(self, index, data):
        self.set_data_bits_auto(index, 0, 7, data)

    """
    设置多个字节的数据
    start_index 数据所在起始字节位, 取值范围0~7
    end_index   数据所在结束字节位, 取值范围0~7
    data        数据内容, 取值范围不可大于 end_index - start_index 个字节的最大取值
    """
    def set_data_bytes_auto(self, start_index, end_index, data):
        # 约束取值范围
        start_byte_scope = start_index < 0 or start_index > 7
        end_byte_scope = end_index < 0 or end_index > 7
        if start_byte_scope or end_byte_scope:
            raise Exception("参数赋值异常,检查参数取值范围")

        # 约束data取值
        check_data = 0
        for i in range(0, end_index - start_index + 1):
            check_data += 0xff << (i * 8)
        if data < 0 or data > check_data:
            raise Exception("data超出可赋最大值,检查取值范围")

        # 计算对应字节位的数据并放入
        c_byte = 0xff
        for i in range(end_index - start_index, -1, -1):
            # 获取当前第几个index的byte, 从0开始
            c_index = end_index - start_index - i
            # c_byte位移到当前所取的8位位置
            c_byte = c_byte << (c_index * 8)
            # 从data中获取c_index所在字节的8位二进制
            current_data = (data & c_byte) >> (c_index * 8)
            self.set_data_auto(end_index - c_index, current_data)

    """
    只设置1个字节位置的数据
    index       数据所在字节位, 取值范围0~7
    start_bit   数据所在起始位, 取值范围0~7
    data        数据内容, 取值范围0~255
    """
    def set_data_bit_auto(self, index, start_bit, data):
        self.set_data_bits_auto(index, start_bit, start_bit, data)

    """
    index       数据所在字节位, 取值范围0~7
    start_bit   数据所在起始位, 取值范围0~7
    end_bit     数据所在结束位, 取值范围0~7
    data        数据内容, 取值范围0~255
    """
    def set_data_bits_auto(self, index, start_bit, end_bit, data):
        # 约束取值范围
        index_scope = index < 0 or index > 7
        start_bit_scope = start_bit < 0 or start_bit > 7
        end_bit_scope = end_bit < 0 or end_bit > 7
        data_scope = data < 0 or data > 255
        start_end_scope = start_bit > end_bit
        if (index_scope or start_bit_scope or end_bit_scope or
                data_scope or start_end_scope):
            raise Exception("参数赋值异常,检查参数取值范围")

        # 约束data取值
        check_byte_arr = [0] * 8
        self.__byte_array_assign(check_byte_arr, start_bit, end_bit, 1)
        check_byte = self.__byte_array_to_bytes(check_byte_arr)
        check_data = data << start_bit
        if check_data < 0 or check_data > check_byte:
            raise Exception("data超出可赋最大值,检查取值范围")

        # 生成清空字节位 start_bit ~ end_bit 的 bytes
        m_byte_arr = [1] * 8
        self.__byte_array_assign(m_byte_arr, start_bit, end_bit, 0)
        m_byte = self.__byte_array_to_bytes(m_byte_arr)

        # 重新设置字节位 start_bit ~ end_bit 的数据
        target_ele = self.elements[index]
        target_ele = (target_ele & m_byte) + (data << start_bit)
        self.elements[index] = target_ele

    """
    汉字或字符转十六进制unicode
    chinese 传入单个汉字或字符
    """
    def chinese_to_hex(self, chinese):
        if len(chinese) > 1:
            raise Exception("汉字数量不能大于1")
        st = chinese.encode('unicode_escape')
        st = st.decode("utf-8")

        # 替换\\u为/u转为unicode进行判断是否为汉字
        # t_st = st.replace("\\u", "/u")
        # is_chinese = self.__is_chinese(t_st)
        # val = int(st, 16) if is_chinese else ord(st)

        # 尝试转unicode 16进制,失败则直接取ascii
        val = ""
        st = st.replace("\\u", "")
        try:
            val = int(st, 16)
        except:
            val = ord(st)
        return val

    def __is_chinese(self, uchar):
        """判断一个unicode是否是汉字"""
        if u'/u4e00' <= uchar <= u'/u9fa5':
            return True
        else:
            return False

    """
    二进制数组转换成bytes
    """
    def __byte_array_to_bytes(self, byte_array):
        m_byte = 0
        for i in range(0, 8):
            m_byte += byte_array[i] << i
        return m_byte

    """
    为byte_array赋值
    byte_array  二进制数组
    start_bit   赋值起始位
    end_bit     赋值结束位,包括结束位
    b           赋值数值
    """
    def __byte_array_assign(self, byte_array, start_bit, end_bit, b):
        for i in range(start_bit, end_bit + 1):
            byte_array[i] = b

    def get_ele(self, index):
        if index < 0 or index > 7:
            return
        return self.elements[index]

    """获取报文标识符"""
    def get_msg_id(self):
        return hex(self.msg_id)

    """报文数据转换为十六进制字符串返回"""
    def get_data(self):
        self.data = bytearray(self.elements)
        # data_str = "["
        data_str = ""
        index = 0
        for value in self.data:
            # value转成十六进制
            hex_val = hex(value)
            # 截取十六进制value取消0x部分后两位
            hex_val = hex_val[2:]
            # 不足两位前面补0
            if len(hex_val) < 2:
                hex_val = "0" + hex_val
            data_str += hex_val
            if index < 7:
                data_str += " "
            index += 1
        # data_str += "]"
        return data_str, self.elements
