# -*- coding: utf-8 -*-
import logging


class LogControl(object):
    @staticmethod
    def add_log(log_content):
        logging.debug(log_content)
