# -*- coding: utf-8 -*-
"""
dorothy_actual_result.py derives from actual_result.py
It defines actual result feedback 

"""
import logging
import sys
from time import sleep

sys.path.append("../..")

from common.actual_result import ActualResult


class DorothyActualResult(ActualResult):
    """
    DorothyActualResult derives from ActualResult
    It implements mock result and actual result read from serial of result port
    It uses a dictionary to store actual results 
    :static variable dist: test result dictionary
    :static variable result_serial_port: result serial port handler
    """
    result_serial_port = None
    dist = {}

    def __init__(self, result_serial_port, mock_enable=False):
        """
        constructor of DorothyActualResult
        :param result_serial_port: result serial port handler
        :param mock_enable: True for mock enable, otherwise disable
        """
        super(DorothyActualResult, self).__init__(mock_enable)
        self.result_serial_port = result_serial_port

    def get_value(self, key):
        """
        get dictionary value according to specified key
        :param key:  actual result dictionary key
        :return: actual result dictionary value
        """
        # read test command to serial port
        out_bytes = ''
        # let's wait one second before reading output (let's give device time to answer)
        sleep(0.1)
        out_buffer_bytes = self.result_serial_port.inWaiting()
        while out_buffer_bytes > 0:
            out_bytes = self.result_serial_port.readline()
            if out_bytes != '':
                logging.info(out_bytes)
            out_buffer_bytes = self.result_serial_port.inWaiting()
        try:
            return_key = out_bytes[0:out_bytes.index('=')]
        except ValueError:
            logging.error("return_key error:" + out_bytes)
        else:
            if key == return_key:
                value = out_bytes[out_bytes.index('=') + 1:len(out_bytes)]
                self.dist[key] = value
            else:
                logging.error('return key error:' + return_key)

        return self.dist[key]
