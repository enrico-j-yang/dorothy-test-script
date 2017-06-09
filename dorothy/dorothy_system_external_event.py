# -*- coding: utf-8 -*-
'''
dorothy_system_external_event.py derives from system_external_event.py
It defines system external event class and methods 

'''
import logging

import sys

sys.path.append("../..")

from common.system_external_event import SystemExternalEvent
from common.test_timer import CallBackTimer


class UnknownResultError(Exception):
    pass


class DorothySystemExternalEvent(SystemExternalEvent):
    '''
    DorothySystemExternalEvent derives from SystemExternalEvent
    :static variable period: control board signal period in mili-second
    :static variable period: control board duration period in mili-second
    :static variable control_board_serial_port: control board serial port handler
    '''
    control_board_serial_port = None

    def __init__(self, control_board_serial_port, mock_enable=False):
        '''
        constructor of DorothySystemExternalEvent
        :param control_board_serial_port: control board serial port handler
        :param mock_enable: True for mock enable, otherwise disable
        '''
        super(SystemExternalEvent, self).__init__(mock_enable)
        self.control_board_serial_port = control_board_serial_port
        self.interval = 0
        self.duration = 0
        self.init_speed = 0
        self.end_speed = 0
        self.data_cycle = {'Speed': 50}
        self.current_speed = 0
        self.threads = []

    def set_value(self, key, value):
        '''
        set dictionary value according to specified key
        :param key: test result dictionary key
        :param value: test result dictionary value
        :return: None
        '''
        self.value_dict[key] = value
        if key == 'Speed':
            self.init_speed = int(value)
            self.end_speed = int(value)

    def send(self, value):
        '''
        send system external event, send value to control board serial port
        :param value: system external event value
        :return: True for event accepted, False for event rejected by control board
        '''
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
        '''
        set signal interval for control board 
        :param interval: control board signal period in mili-second
        :return: None
        '''
        logging.debug("set_signal_interval:" + str(interval))
        self.interval = int(interval)

    def set_signal_duration(self, duration):
        '''
        Set signal duration
        :param duration: control board signal duration in mili-second
        :return: None
        '''
        logging.debug("set_signal_duration:" + str(duration))
        self.duration = int(duration)

    def set_initial_speed(self, speed):
        '''
        set signal period for control board 
        :param speed: speed in km/s
        :return: None
        '''
        logging.debug("set_initial_speed:" + speed)
        self.init_speed = int(speed)
        self.value_dict['Speed'] = self.init_speed

    def set_end_speed(self, speed):
        '''
        set signal period for control board 
        :param speed: speed in km/s
        :return: None
        '''
        logging.debug("set_end_speed:" + speed)
        self.end_speed = int(speed)
        self.value_dict['Speed'] = self.end_speed

    def start_generate_signal(self):
        '''
        start generate signal to control board
        :return: None
        '''
        logging.debug("start_generate_signal")

        for key in self.value_dict:
            logging.debug("value_dict key:" + key + " value:" + str(self.value_dict[key]))
            try:
                self.interval = self.data_cycle[key]
            except KeyError:
                logging.error("data_cycle Key:" + key + " Not found")
            else:
                logging.debug("data_cycle key:" + key + " value:" + str(self.interval))
                t = CallBackTimer(self.interval, self.duration, self.send_speed)
                self.threads.append(t)
                t.start()

        # wait for all timer threads end
        for t in self.threads:
            t.join()

    def stop_generate_signal(self):
        '''
        stop generate signal to control board
        :return: None
        '''
        logging.debug("stop_generate_signal")
        # wait for all timer threads end
        for t in self.threads:
            t.stop()

    def send_speed(self, eclipse_time):
        logging.debug("eclipse_time:" + str(eclipse_time))
        logging.debug("init_speed:" + str(self.init_speed))
        logging.debug("end_speed:" + str(self.end_speed))
        logging.debug("duration:" + str(self.duration))
        self.current_speed = self.init_speed + (self.end_speed -
                                                self.init_speed * eclipse_time / self.duration)
        logging.debug("current_speed:" + str(self.current_speed))
