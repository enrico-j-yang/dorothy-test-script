# -*- coding: utf-8 -*-
"""
environment.py is pre-process and post-process for all step implementation files

"""
import platform

from dorothy.dorothy_can_serial import *
from can_sim.nav_script import *
from common.test_input import TestInput
from common.test_serial import TestSerial
from dorothy.dorothy_actual_result import DorothyActualResult
from dorothy.dorothy_expected_result import DorothyExpectedResult
from dorothy.dorothy_log_control import LogControl
from dorothy.dorothy_package_set import *
from dorothy.dorothy_system_external_event import DorothySystemExternalEvent

logging.basicConfig(level=logging.DEBUG,
                    format='%(asctime)s %(filename)s[line:%(lineno)d] %(levelname)s %(message)s',
                    datefmt='%a, %d %b %Y %H:%M:%S',
                    filename='dorothy_test.log',
                    filemode='w')


class PlatformNotSupportedError(Exception):
    pass


def before_all(context):
    """
    Initial serial ports, test input, test result. Set mock_enable to True to enable mock mode.
    :param context: behave global variable
    :return: None
    """

    context.log_control = LogControl
    context.can_serial = SerialPort(context.log_control, mock_enable=True)
    context.p_set = DorothyPackageSet(context.can_serial)
    context.nav_script = NavScript(context.can_serial)
    context.nav_script.set_log_frame(context.log_control)

    if platform.system() == 'Windows':
        logging.info("连接中....")
        context.control_board_serial_port = context.p_set
        if context.control_board_serial_port.connect() == 1:
            logging.info("连接成功")
        else:
            logging.error("连接失败")
            raise ConnectionError

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
            raise Exception
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
    """
    Close all serial port after all feature done
    :param context: behave global variable
    :return: None
    """
    if context.control_board_serial_port is not None:
        logging.info("断开中....")
        if context.control_board_serial_port.disconnect() == 1:
            logging.info("断开成功")
        else:
            logging.error("断开错误")

    try:
        context.result_serial_port.close()
    except AttributeError:
        logging.error("close port error")


# noinspection PyUnusedLocal
def before_scenario(context, scenario):
    context.dorothyTestInput.sysExtEvt.set_up()
