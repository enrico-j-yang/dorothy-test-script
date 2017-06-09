# -*- coding: utf-8 -*-
'''
system_external_event.py derives from test_input.py
It defines system external event class and methods 

'''
import logging
import sys
from time import sleep

sys.path.append("../..")

from common.test_input import TestInput


class UnknownResultError(Exception):
    pass


class SystemExternalEvent(TestInput):
    '''
    SystemExternalEvent derives from TestInput
    '''

    def __init__(self, mock_enable=False):
        '''
        constructor of SystemExternalEvent
        :param mock_enable: True for mock enable, otherwise disable
        '''
        super(SystemExternalEvent, self).__init__(mock_enable)

    def send(self, value):
        '''
        send system external event, send value to control board serial port
        :param value: system external event value
        :return: True for event accepted, False for event rejected by control board
        '''
        logging.debug("send:" + value)
