# -*- coding: utf-8 -*-
'''
environment.py is pre-process and post-process for all step implementation files

'''
import logging
import platform
import sys

sys.path.append("../..")

from common.test_input import TestInput
from dorothy.dorothy_system_external_event import DorothySystemExternalEvent
from dorothy.dorothy_expected_result import DorothyExpectedResult
from dorothy.dorothy_actual_result import DorothyActualResult
from common.test_serial import TestSerial

logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S',
                    filename='dorothy_test.log',
                    filemode='w')


class PlatformNotSupportedError(Exception):
    pass


def before_all(context):
    '''
    Initial serial ports, test input, test result. Set mock_enable to True to enable mock mode.
    :param context: behave global variable
    :return: None
    '''
    if platform.system() == 'Windows':
        try:
            context.control_board_serial_port = TestSerial(port='COM3',
                                                           baudrate=9600,
                                                           timeout=0,
                                                           parity=TestSerial.PARITY_NONE,
                                                           stopbits=TestSerial.STOPBITS_ONE,
                                                           bytesize=TestSerial.EIGHTBITS,
                                                           mock_enable=True)
        except TestSerial.SerialException:
            logging.error("TestSerial.SerialException")
            raise TestSerial.SerialException
        except Exception as e:
            logging.error("Unknown exception:" + str(e))
        else:
            logging.info("serial opened")

        try:
            context.result_serial_port = TestSerial(port='COM5',
                                                    baudrate=9600,
                                                    timeout=0,
                                                    parity=TestSerial.PARITY_NONE,
                                                    stopbits=TestSerial.STOPBITS_ONE,
                                                    bytesize=TestSerial.EIGHTBITS,
                                                    mock_enable=True)
        except TestSerial.SerialException:
            logging.error("TestSerial.SerialException")
            raise TestSerial.SerialException
        except Exception as e:
            logging.error("Unknown exception:" + str(e))
        else:
            logging.info("serial opened")

    elif platform.system() == 'Darwin':
        try:
            context.control_board_serial_port = TestSerial(port='/dev/tty.wchusbserial14120',
                                                           baudrate=9600,
                                                           timeout=0,
                                                           parity=TestSerial.PARITY_NONE,
                                                           stopbits=TestSerial.STOPBITS_ONE,
                                                           bytesize=TestSerial.EIGHTBITS,
                                                           mock_enable=True)
        except TestSerial.SerialException:
            logging.error("TestSerial.SerialException")
            raise TestSerial.SerialException
        except Exception as e:
            logging.error("Unknown exception:" + str(e))
        else:
            logging.info("serial opened")

        try:
            context.result_serial_port = TestSerial(port='/dev/tty.wchusbserial14140',
                                                    baudrate=9600,
                                                    timeout=0,
                                                    parity=TestSerial.PARITY_NONE,
                                                    stopbits=TestSerial.STOPBITS_ONE,
                                                    bytesize=TestSerial.EIGHTBITS,
                                                    mock_enable=True)
        except TestSerial.SerialException:
            logging.error("TestSerial.SerialException")
            raise TestSerial.SerialException
        except Exception as e:
            logging.error("Unknown exception:" + str(e))
        else:
            logging.info("serial opened")

    else:
        logging.error("platform:" + platform.system() + "not supported")
        raise PlatformNotSupportedError

    context.dorothyTestInput = TestInput()
    context.dorothyTestInput.sysExtEvt = DorothySystemExternalEvent(context.control_board_serial_port, mock_enable=True)
    context.dorothyExpRes = DorothyExpectedResult()
    context.dorothyActRes = DorothyActualResult(context.result_serial_port, mock_enable=True)


def after_all(context):
    '''
    Close all serial port after all feature done
    :param context: behave global variable
    :return: None
    '''
    context.control_board_serial_port.close()
    context.result_serial_port.close()
