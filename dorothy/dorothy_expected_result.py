# -*- coding: utf-8 -*-
"""
expected_result.py derives from test_result.py
It defines expected result serial feedback

"""

from common.expected_result import ExpectedResult


class DorothyExpectedResult(ExpectedResult):
    """
    DorothyExpectedResult derives from TestResult
    """

    def __init__(self):
        """
        constructor of DorothyExpectedResult
        """
        super(DorothyExpectedResult, self).__init__()
