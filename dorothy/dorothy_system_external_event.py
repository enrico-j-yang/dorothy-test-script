# -*- coding: utf-8 -*-
"""
dorothy_system_external_event.py derives from system_external_event.py
It defines system external event class and methods

"""
import logging

from common.system_external_event import SystemExternalEvent
from common.test_timer import CallBackTimer


class UnknownResultError(Exception):
    pass


class DorothySystemExternalEvent(SystemExternalEvent):
    """
    DorothySystemExternalEvent derives from SystemExternalEvent
    :static variable period: control board signal period in milli-second
    :static variable period: control board duration period in milli-second
    :static variable control_board_serial_port: control board serial port handler
    """
    control_board_serial_port = None
    cycle_dict = {'Speed': 50,
                  'RPM': 10,
                  'CruiseLimitIndicator': 100}
    field_map = {'Speed': 'Speed',
                 'RPM': 'RPM',
                 'RPMValid': 'RPM',
                 'LimitControlStatus': 'RPM',
                 'CruiseControlStatus': 'RPM',
                 'LimitCruiseSpeed': 'RPM',
                 'EngineRunningStatus': 'RPM',
                 'LimitIndicator': 'CruiseLimitIndicator',
                 'LimitUnavailDisplay': 'CruiseLimitIndicator',
                 'CruiseIndicator': 'CruiseLimitIndicator',
                 'CruiseUnavailDisplay': 'CruiseLimitIndicator'}

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
        self.init_speed = 0
        self.end_speed = 0
        self.current_speed = 0
        self.threads = []
        self.longest_thread = None
        self.longest_duration = 0
        self.speed_dict = {'Speed': None}
        self.rpm_dict = {'RPM': None,
                         'RPMValid': None,
                         'LimitControlStatus': None,
                         'CruiseControlStatus': None,
                         'LimitCruiseSpeed': None,
                         'EngineRunningStatus': None}
        self.cruise_limit_dict = {'LimitIndicator': None,
                                  'LimitUnavailDisplay': None,
                                  'CruiseIndicator': None,
                                  'CruiseUnavailDisplay': None}
        self.msg_dict = {'Speed': self.speed_dict,
                         'RPM': self.rpm_dict,
                         'CruiseLimitIndicator': self.cruise_limit_dict}
        self.msg = {}

    def set_up(self):
        self.interval = 0
        self.duration = 0
        self.init_speed = 0
        self.end_speed = 0
        self.current_speed = 0
        self.threads = []
        self.longest_thread = None
        self.longest_duration = 0
        self.msg = {}

    #def tear_down(self):


    def set_value(self, key, value):
        """
        set dictionary value according to specified key
        :param key: test result dictionary key
        :param value: test result dictionary value
        :return: None
        """
        self.msg[self.field_map[key]] = self.msg_dict[self.field_map[key]]
        self.msg[self.field_map[key]][key] = value

        if key == 'Speed':
            self.init_speed = int(value)
            self.end_speed = int(value)

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
        :param interval: control board signal period in milli-second
        :return: None
        """
        logging.debug("set_signal_interval:" + str(interval))
        self.interval = int(interval)

    def set_signal_duration(self, duration):
        """
        Set signal duration
        :param duration: control board signal duration in milli-second
        :return: None
        """
        logging.debug("set_signal_duration:" + str(duration))
        self.duration = int(duration)

    def set_initial_speed(self, speed):
        """
        set signal period for control board
        :param speed: speed in km/s
        :return: None
        """
        logging.debug("set_initial_speed:" + str(speed))
        self.init_speed = int(speed)
        self.msg[self.field_map['Speed']] = self.msg_dict[self.field_map['Speed']]
        self.msg[self.field_map['Speed']]['Speed'] = self.init_speed

    def set_end_speed(self, speed):
        """
        set signal period for control board
        :param speed: speed in km/s
        :return: None
        """
        logging.debug("set_end_speed:" + str(speed))
        self.end_speed = int(speed)

    def start_generate_signal(self):
        """
        start generate signal to control board
        :return: None
        """
        logging.debug("start_generate_signal")

        for key in self.msg:
            logging.debug("msg key:" + key)
            try:
                self.interval = self.cycle_dict[key]
            except KeyError:
                logging.error("cycle_dict Key:" + key + " Not found")
            else:
                logging.debug("cycle_dict key:" + key + " value:" + str(self.interval))
                if key == 'Speed':
                    t = CallBackTimer(self.interval, self.duration, self.send_speed)
                    self.threads.append(t)
                    if self.duration >= self.longest_duration:
                        self.longest_thread = t
                        self.longest_duration = self.duration
                    t.start()
                elif key == 'RPM':
                    t = CallBackTimer(self.interval, self.duration, self.send_rpm_cruise_limit)
                    self.threads.append(t)
                    if self.duration >= self.longest_duration:
                        self.longest_thread = t
                        self.longest_duration = self.duration
                    t.start()
                elif key == 'CruiseLimitIndicator':
                    t = CallBackTimer(self.interval, self.duration, self.send_cruise_limit_indicator)
                    self.threads.append(t)
                    if self.duration >= self.longest_duration:
                        self.longest_thread = t
                        self.longest_duration = self.duration
                    t.start()

        # wait for all timer threads end
        self.longest_thread.join()
        # for t in self.threads:
        #    t.join()

    def stop_generate_signal(self):
        """
        stop generate signal to control board
        :return: None
        """
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
                                                self.init_speed) * eclipse_time / self.duration

        self.msg[self.field_map['Speed']]['Speed'] = self.current_speed
        logging.debug("current_speed:" + str(self.current_speed))

    def send_rpm_cruise_limit(self, eclipse_time):
        logging.debug("eclipse_time:" + str(eclipse_time))
        logging.debug("RPM:" + str(self.rpm_dict['RPM']))
        logging.debug("RPMValid:" + str(self.rpm_dict['RPMValid']))
        logging.debug("LimitControlStatus:" + str(self.rpm_dict['LimitControlStatus']))
        logging.debug("CruiseControlStatus:" + str(self.rpm_dict['CruiseControlStatus']))
        logging.debug("LimitCruiseSpeed:" + str(self.rpm_dict['LimitCruiseSpeed']))
        logging.debug("EngineRunningStatus:" + str(self.rpm_dict['EngineRunningStatus']))

    def send_cruise_limit_indicator(self, eclipse_time):
        logging.debug("eclipse_time:" + str(eclipse_time))
        logging.debug("LimitIndicator:" + str(self.cruise_limit_dict['LimitIndicator']))
        logging.debug("LimitUnavailDisplay:" + str(self.cruise_limit_dict['LimitUnavailDisplay']))
        logging.debug("CruiseIndicator:" + str(self.cruise_limit_dict['CruiseIndicator']))
        logging.debug("CruiseUnavailDisplay:" + str(self.cruise_limit_dict['CruiseUnavailDisplay']))
