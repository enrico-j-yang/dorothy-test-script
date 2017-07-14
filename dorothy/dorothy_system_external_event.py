# -*- coding: utf-8 -*-
"""
dorothy_system_external_event.py derives from system_external_event.py
It defines system external event class and methods

"""
import logging

from common.system_external_event import SystemExternalEvent


class UnknownResultError(Exception):
    pass


class UnKnownKeyError(Exception):
    pass


class DorothySystemExternalEvent(SystemExternalEvent):
    """
    DorothySystemExternalEvent derives from SystemExternalEvent
    :static variable period: control board signal period in milli-second
    :static variable period: control board duration period in milli-second
    :static variable control_board_serial_port: control board serial port handler
    """
    control_board_serial_port = None
    digital_values = {}
    list_values = {}
    navigation_digital_values = {}
    navigation_list_values = {}
    navigation_road_values = {}

    def __init__(self, control_board_serial_port, mock_enable=False):
        """
        constructor of DorothySystemExternalEvent
        :param control_board_serial_port: control board serial port handler
        :param mock_enable: True for mock enable, otherwise disable
        """
        super(SystemExternalEvent, self).__init__(mock_enable)
        self.control_board_serial_port = control_board_serial_port
        self.interval = 0
        self.duration = 0
        self.current_speed = 0
        self.current_temp = 0
        self.p_set = self.control_board_serial_port
        self.dest_distance = 0
        self.dest_hour = 0
        self.dest_minute = 0
        self.next_cross_distance = 0

    def set_up(self):
        self.p_set.set_up()
        self.interval = 0
        self.duration = 0
        self.current_speed = 0
        self.current_temp = 0
        self.dest_distance = 0
        self.dest_hour = 0
        self.dest_minute = 0
        self.next_cross_distance = 0
        self.digital_values = self.p_set.digital_values
        self.list_values = self.p_set.list_values
        self.navigation_digital_values = self.p_set.navigation_digital_values
        self.navigation_list_values = self.p_set.navigation_list_values
        self.navigation_road_values = self.p_set.navigation_road_values

    # def tear_down(self):

    def set_value(self, key, value):
        """
        set dictionary value according to specified key
        :param key: test result dictionary key
        :param value: test result dictionary value
        :return: None
        """

        if self.digital_values.get(key) is not None:
            self.p_set.set_initial_value(key, float(value))
            self.p_set.set_end_value(key, float(value))
            self.digital_values.get(key)["Process Set Value Method"](float(value))
        elif self.list_values.get(key) is not None:
            self.list_values.get(key)["Process Set Value Method"](value)
        elif self.navigation_digital_values.get(key) is not None:
            self.p_set.set_initial_navigation_value(key, float(value))
            self.p_set.set_end_navigation_value(key, float(value))
            self.next_cross_distance = float(value)
            self.navigation_digital_values.get(key)["Process Set Value Method"](self.dest_distance,
                                                                                self.dest_hour,
                                                                                self.dest_minute,
                                                                                self.next_cross_distance)
            self.p_set.enable_navigation()
        elif self.navigation_list_values.get(key) is not None:
            # TODO:navigation_list_values
            print("navigation_list_values")
            self.p_set.enable_navigation()
        elif self.navigation_road_values.get(key) is not None:
            self.p_set.set_navigation_road_name(key, value)
            self.p_set.enable_navigation()
        else:
            raise UnKnownKeyError

    def send(self, value):
        """
        send system external event, send value to control board serial port
        :param value: system external event value
        :return: True for event accepted, False for event rejected by control board
        """
        # write test command to serial port
        self.control_board_serial_port.write(value)

        out_bytes = ''
        # let's wait one second before reading output (let's give device time to answer)
        # sleep(0.1)
        out_buffer_bytes = self.control_board_serial_port.inWaiting()
        while out_buffer_bytes > 0:
            out_bytes = self.control_board_serial_port.readline()
            if out_bytes != '':
                logging.info(out_bytes)
            out_buffer_bytes = self.control_board_serial_port.inWaiting()

        logging.debug("out_bytes:" + out_bytes)

        if self.mock_enable:
            if out_bytes == 'Result=OK':
                return True
            elif out_bytes == 'Result=Fail':
                return False
            else:
                raise UnknownResultError
        '''
        if str(out_bytes[0:len(out_bytes) - 2].decode('UTF-8')) == 'Result=OK':
            return True
        elif str(out_bytes[0:len(out_bytes) - 2].decode('UTF-8')) == 'Result=Fail':
            return False
        else:
            raise UnknownResultError
        '''

    def set_signal_interval(self, interval):
        """
        set signal interval for control board
        :param interval: control board signal period in second
        :return: None
        """
        logging.debug("set_signal_interval:" + str(interval))
        self.interval = float(interval)

    def set_signal_duration(self, duration):
        """
        Set signal duration
        :param duration: control board signal duration in second
        :return: None
        """
        logging.debug("set_signal_duration:" + str(duration))
        self.duration = float(duration)
        self.p_set.set_duration(duration)

    def set_initial_value(self, key, value):
        """
        set initial value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_initial_value:" + str(value))
        self.p_set.set_initial_value(key, float(value))

    def set_end_value(self, key, value):
        """
        set end value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_end_value:" + str(value))
        self.p_set.set_end_value(key, float(value))

    def set_initial_navigation_value(self, key, value):
        """
        set initial value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_initial_value:" + str(value))
        self.p_set.set_initial_navigation_value(key, float(value))

    def set_end_navigation_value(self, key, value):
        """
        set end value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_end_value:" + str(value))
        self.p_set.set_end_navigation_value(key, float(value))

    def start_generate_signal(self):
        """
        start generate signal to control board
        :return: None
        """
        logging.debug("start_generate_signal")
        return self.control_board_serial_port.start_send()

    def stop_generate_signal(self):
        """
        stop generate signal to control board
        :return: None
        """
        logging.debug("stop_generate_signal")

        return self.control_board_serial_port.stop_send()
