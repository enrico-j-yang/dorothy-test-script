# -*- coding: utf-8 -*-
'''
actual_result.py derives from test_result.py
It defines actual result and bluetooth serials feedback 

'''
import logging


class TestInput:
    '''
    TestInput is general test input class
    :static variable sysExtEvt: system external events
    :static variable sysIntEvt: system internal events
    :static variable humanInputEvt: human input events
    :static variable mock_enable: True for mock enable, otherwise disable
    :static variable value_dict: test input dictionary
    '''
    sysExtEvt = None
    sysIntEvt = None
    humanInputEvt = None
    mock_enable = False
    value_dict = {}

    def __init__(self, mock_enable=False):
        '''
        constructor of TestInput
        :param mock_enable: True for mock enable, otherwise disable
        '''
        self.mock_enable = mock_enable
        if self.mock_enable:
            logging.debug('TestInput enable')
        else:
            logging.debug('TestInput')

    def set_value(self, key, value):
        '''
        set dictionary value according to specified key
        :param key: test result dictionary key
        :param value: test result dictionary value
        :return: None
        '''
        self.value_dict[key] = value

    def mock_value(self, key, value):
        '''
        set dictionary value according to specified key if mock is enabled
        :param key: test result dictionary key
        :param value: test result dictionary value
        :return: None
        '''
        if self.mock_enable:
            self.set_value(key, value)

    def get_value(self, key):
        '''
        get dictionary value according to specified key
        :param key:  test result dictionary key
        :return: test result dictionary value
        '''
        return self.value_dict[key]
