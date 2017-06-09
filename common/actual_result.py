# -*- coding: utf-8 -*-
"""
actual_result.py derives from test_result.py
It defines actual result and bluetooth serials feedback 

"""
import sys

sys.path.append("../..")

from common.test_result import TestResult


class PlatformNotSupportedError(Exception):
    pass


class ActualResult(TestResult):
    """
    ActualResult derives from TestResult
    It uses a dictionary to store actual results 
    :static variable dist: test result dictionary
    """
    dist = {}

    def __init__(self, mock_enable=False):
        """
        constructor of ActualResult
        :param mock_enable: True for mock enable, otherwise disable
        """
        super(ActualResult, self).__init__(mock_enable)

    def set_value(self, key, value):
        """
        set dictionary value according to specified key
        :param key: actual result dictionary key
        :param value: actual result dictionary value
        :return: None
        """
        self.dist[key] = value

    def mock_value(self, key, value):
        """
        set dictionary value according to specified key if mock is enabled
        :param key: actual result dictionary key
        :param value: actual result dictionary value
        :return: None
        """
        if self.mock_enable:
            self.set_value(key, value)

    def get_value(self, key):
        """
        get dictionary value according to specified key
        :param key:  actual result dictionary key
        :return: actual result dictionary value
        """

        return self.dist[key]
