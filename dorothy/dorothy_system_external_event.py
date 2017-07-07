# -*- coding: utf-8 -*-
"""
dorothy_system_external_event.py derives from system_external_event.py
It defines system external event class and methods

"""
import logging

from common.system_external_event import SystemExternalEvent

from can_sim.speed_p import *
from can_sim.engine_p import *
from can_sim.tire_p import *
from can_sim.hud_set_p import *
from can_sim.fuel_p import *
from can_sim.ldw_p import *
from can_sim.navigation_p import *


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
        self.speed_p = SpeedP()
        self.engine_p = CoolantTemperatureP()
        self.tire_p = TireP()
        self.hud_set_p = HudSetP()
        self.fuel_p = FuelP()
        self.ldw_p = LdwP()
        self.navigation_p = NavigationP()
        self.limit_p = LimitSpeedP()
        self.indicator_p = IndicatorP()
        self.p_set = self.control_board_serial_port

    def set_up(self):
        self.interval = 0
        self.duration = 0

    # def tear_down(self):

    def set_value(self, key, value):
        """
        set dictionary value according to specified key
        :param key: test result dictionary key
        :param value: test result dictionary value
        :return: None
        """

        if key == 'Speed':
            self.p_set.set_initial_speed(int(value))
            self.p_set.set_end_speed(int(value))
            # if self.nav_script is not None:
            #    self.nav_script.set_car_speed(int(value))
            self.speed_p.set_speed(int(value))
            self.p_set.set(self.p_set.var_speed,
                           self.speed_p.get_data())
        elif key == 'RPM':
            self.limit_p.set_rpm(int(value))
            self.p_set.set(self.p_set.var_limit_speed,
                           self.limit_p.get_data())
        elif key == 'RPMValid':
            if not value:
                self.limit_p.set_rpm_valid(1)
            else:
                self.limit_p.set_rpm_valid(0)
            self.p_set.set(self.p_set.var_limit_speed,
                           self.limit_p.get_data())
        elif key == 'LimitCruiseSpeed':
            self.limit_p.set_limit_speed(int(value))
            self.p_set.set(self.p_set.var_limit_speed,
                           self.limit_p.get_data())
        elif key == 'LimitControlStatus':
            self.limit_p.set_limit_status(value)
            self.p_set.set(self.p_set.var_limit_speed,
                           self.limit_p.get_data())
        elif key == 'CruiseControlStatus':
            self.limit_p.set_cruise_status(value)
            self.p_set.set(self.p_set.var_limit_speed,
                           self.limit_p.get_data())
        elif key == 'EngineRunningStatus':
            self.limit_p.set_engine_status(value)
            self.p_set.set(self.p_set.var_limit_speed,
                           self.limit_p.get_data())
        elif key == 'LimitIndicator':
            self.indicator_p.set_cruise_indicate(value)
            self.p_set.set(self.p_set.var_indicator,
                           self.indicator_p.get_data())
        elif key == 'LimitUnavailDisplay':
            self.indicator_p.set_cruise_unavail_display(value)
            self.p_set.set(self.p_set.var_indicator,
                           self.indicator_p.get_data())
        elif key == 'CruiseIndicator':
            self.indicator_p.set_limit_indicate(value)
            self.p_set.set(self.p_set.var_indicator,
                           self.indicator_p.get_data())
        elif key == 'CruiseUnavailDisplay':
            self.indicator_p.set_limit_unavail_display(value)
            self.p_set.set(self.p_set.var_indicator,
                           self.indicator_p.get_data())
        elif key == 'ECT':
            self.p_set.set_initial_temp(int(value))
            self.p_set.set_end_temp(int(value))
            self.engine_p.set_temperature(int(value))
            self.p_set.set(self.p_set.var_coolant_temp,
                           self.engine_p.get_data())
        elif key == 'ECTValid':
            if not value:
                self.engine_p.set_status(1)
            else:
                self.engine_p.set_status(0)
            self.p_set.set(self.p_set.var_coolant_temp,
                           self.engine_p.get_data())

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
        self.interval = int(interval)

    def set_signal_duration(self, duration):
        """
        Set signal duration
        :param duration: control board signal duration in second
        :return: None
        """
        logging.debug("set_signal_duration:" + str(duration))
        self.duration = int(duration)
        self.p_set.set_duration(duration)

    def set_initial_speed(self, speed):
        """
        set signal period for control board
        :param speed: speed in km/s
        :return: None
        """
        logging.debug("set_initial_speed:" + str(speed))
        self.init_speed = int(speed)
        self.p_set.set_initial_speed(self.init_speed)

    def set_end_speed(self, speed):
        """
        set signal period for control board
        :param speed: speed in km/s
        :return: None
        """
        logging.debug("set_end_speed:" + str(speed))
        self.end_speed = int(speed)
        self.p_set.set_end_speed(self.end_speed)

    def set_initial_temp(self, temp):
        """
        set signal period for control board
        :param temp: temperature
        :return: None
        """
        logging.debug("set_initial_temp:" + str(temp))
        self.init_temp = int(temp)
        self.p_set.set_initial_temp(self.init_temp)

    def set_end_temp(self, temp):
        """
        set signal period for control board
        :param temp: temperature
        :return: None
        """
        logging.debug("set_end_temp:" + str(temp))
        self.end_temp = int(temp)
        self.p_set.set_end_temp(self.end_temp)

    def start_generate_signal(self):
        """
        start generate signal to control board
        :return: None
        """
        logging.debug("start_generate_signal")
        self.control_board_serial_port.start_send()

    def stop_generate_signal(self):
        """
        stop generate signal to control board
        :return: None
        """
        logging.debug("stop_generate_signal")

        self.control_board_serial_port.stop_send()
