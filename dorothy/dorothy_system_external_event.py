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
    digital_values = {}
    navigation_values = {}

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
        self.dest_distance = 0
        self.dest_hour = 0
        self.dest_minute = 0
        self.next_cross_distance = 0

    def set_up(self):
        self.interval = 0
        self.duration = 0
        self.digital_values = {
            "Speed": {"Package": "speed",
                      "Initial Value": 0,
                      "End Value": 0,
                      "Process": self.speed_p,
                      "Process Set Value Method": self.speed_p.set_speed,
                      "Package List Name": self.p_set.var_speed},
            "ECT": {"Package": "coolant_temp",
                    "Initial Value": 0,
                    "End Value": 0,
                    "Process": self.engine_p,
                    "Process Set Value Method": self.engine_p.set_temperature,
                    "Package List Name": self.p_set.var_coolant_temp},
            "RPM": {"Package": "var_limit_speed",
                    "Initial Value": 0,
                    "End Value": 0,
                    "Process": self.limit_p,
                    "Process Set Value Method": self.limit_p.set_rpm,
                    "Package List Name": self.p_set.var_limit_speed},
            "LimitCruiseSpeed": {"Package": "var_limit_speed",
                                 "Initial Value": 0,
                                 "End Value": 0,
                                 "Process": self.limit_p,
                                 "Process Set Value Method": self.limit_p.set_limit_speed,
                                 "Package List Name": self.p_set.var_limit_speed},
            "SurplusFuel": {"Package": "fuel",
                            "Initial Value": 0,
                            "End Value": 0,
                            "Process": self.fuel_p,
                            "Process Set Value Method": self.fuel_p.set_fuel,
                            "Package List Name": self.p_set.var_fuel},
        }

        self.navigation_values = {
            "DestDistance": {"Package": "navigation_1",
                             "Initial Value": 0,
                             "End Value": 0,
                             "Process": self.navigation_p,
                             "Process Set Value Method": self.navigation_p.set_nav_distance_and_time,
                             "Package List Name": self.p_set.var_navigation_navi1},
            "DestHour": {"Package": "navigation_1",
                         "Initial Value": 0,
                         "End Value": 0,
                         "Process": self.navigation_p,
                         "Process Set Value Method": self.navigation_p.set_nav_distance_and_time,
                         "Package List Name": self.p_set.var_navigation_navi1},
            "DestMinute": {"Package": "navigation_1",
                           "Initial Value": 0,
                           "End Value": 0,
                           "Process": self.navigation_p,
                           "Process Set Value Method": self.navigation_p.set_nav_distance_and_time,
                           "Package List Name": self.p_set.var_navigation_navi1},
            "NextCrossDistance": {"Package": "navigation_1",
                                  "Initial Value": 0,
                                  "End Value": 0,
                                  "Process": self.navigation_p,
                                  "Process Set Value Method": self.navigation_p.set_nav_distance_and_time,
                                  "Package List Name": self.p_set.var_navigation_navi1},
        }

    # def tear_down(self):

    def set_value(self, key, value):
        """
        set dictionary value according to specified key
        :param key: test result dictionary key
        :param value: test result dictionary value
        :return: None
        """

        if key == 'Speed':
            self.p_set.set_initial_value(key, float(value))
            self.p_set.set_end_value(key, float(value))
            # if self.nav_script is not None:
            #    self.nav_script.set_car_speed(float(value))
            self.digital_values.get(key)["Process Set Value Method"](float(value))
            self.p_set.set(self.digital_values.get(key)["Package List Name"],
                           self.digital_values.get(key)["Process"].get_data())
        elif key == 'RPM':
            self.p_set.set_initial_value(key, float(value))
            self.p_set.set_end_value(key, float(value))
            self.digital_values.get(key)["Process Set Value Method"](float(value))
            self.p_set.set(self.digital_values.get(key)["Package List Name"],
                           self.digital_values.get(key)["Process"].get_data())
        elif key == 'RPMValid':
            if not value:
                self.limit_p.set_rpm_valid(1)
            else:
                self.limit_p.set_rpm_valid(0)
            self.p_set.set(self.p_set.var_limit_speed,
                           self.limit_p.get_data())
        elif key == 'LimitCruiseSpeed':
            self.p_set.set_initial_value(key, float(value))
            self.p_set.set_end_value(key, float(value))
            self.digital_values.get(key)["Process Set Value Method"](float(value))
            self.p_set.set(self.digital_values.get(key)["Package List Name"],
                           self.digital_values.get(key)["Process"].get_data())
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
            self.p_set.set_initial_value(key, float(value))
            self.p_set.set_end_value(key, float(value))
            self.digital_values.get(key)["Process Set Value Method"](float(value))
            self.p_set.set(self.digital_values.get(key)["Package List Name"],
                           self.digital_values.get(key)["Process"].get_data())
        elif key == 'ECTValid':
            if not value:
                self.engine_p.set_status(1)
            else:
                self.engine_p.set_status(0)
            self.p_set.set(self.p_set.var_coolant_temp,
                           self.engine_p.get_data())
        elif key == 'SurplusFuel':
            self.p_set.set_initial_value(key, float(value))
            self.p_set.set_end_value(key, float(value))
            self.digital_values.get(key)["Process Set Value Method"](float(value))
            self.p_set.set(self.digital_values.get(key)["Package List Name"],
                           self.digital_values.get(key)["Process"].get_data())
        elif key == 'DriverSeatBeltLamp':
            self.fuel_p.set_driver_seat_belt_warning(value)
            self.p_set.set(self.p_set.var_fuel,
                           self.fuel_p.get_data())
        elif key == 'PassengerSeatBeltLamp':
            self.fuel_p.set_passenger_seat_belt_warning(value)
            self.p_set.set(self.p_set.var_fuel,
                           self.fuel_p.get_data())
        elif key == 'DestDistance':
            self.p_set.set_initial_navigation_value(key, float(value))
            self.p_set.set_end_navigation_value(key, float(value))
            self.dest_distance = float(value)
            self.navigation_values.get(key)["Process Set Value Method"](self.dest_distance, self.dest_hour,
                                                                        self.dest_minute, self.next_cross_distance)
            self.p_set.set_navigation(self.navigation_values.get(key)["Package List Name"],
                                      self.navigation_values.get(key)["Process"].get_data())
        elif key == 'DestHour':
            self.p_set.set_initial_navigation_value(key, float(value))
            self.p_set.set_end_navigation_value(key, float(value))
            self.dest_hour = float(value)
            self.navigation_values.get(key)["Process Set Value Method"](self.dest_distance, self.dest_hour,
                                                                        self.dest_minute, self.next_cross_distance)
            self.p_set.set_navigation(self.navigation_values.get(key)["Package List Name"],
                                      self.navigation_values.get(key)["Process"].get_data())
        elif key == 'DestMinute':
            self.p_set.set_initial_navigation_value(key, float(value))
            self.p_set.set_end_navigation_value(key, float(value))
            self.dest_minute = float(value)
            self.navigation_values.get(key)["Process Set Value Method"](self.dest_distance, self.dest_hour,
                                                                        self.dest_minute, self.next_cross_distance)
            self.p_set.set_navigation(self.navigation_values.get(key)["Package List Name"],
                                      self.navigation_values.get(key)["Process"].get_data())
        elif key == 'NextCrossDistance':
            self.p_set.set_initial_navigation_value(key, float(value))
            self.p_set.set_end_navigation_value(key, float(value))
            self.next_cross_distance = float(value)
            self.navigation_values.get(key)["Process Set Value Method"](self.dest_distance, self.dest_hour,
                                                                        self.dest_minute, self.next_cross_distance)
            self.p_set.set_navigation(self.navigation_values.get(key)["Package List Name"],
                                      self.navigation_values.get(key)["Process"].get_data())

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
        self.control_board_serial_port.start_send()

    def stop_generate_signal(self):
        """
        stop generate signal to control board
        :return: None
        """
        logging.debug("stop_generate_signal")

        self.control_board_serial_port.stop_send()
