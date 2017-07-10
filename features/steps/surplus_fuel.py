# -*- coding: utf-8 -*-
"""
surplus_fuel.py is step implementation file for SurplusFuel.feature

"""
import logging
from time import sleep

from behave import *


@when(u'CANBUS上有剩余油量为{surplus_fuel}升')
def step_impl(context, surplus_fuel):
    context.dorothyTestInput.sysExtEvt.set_value('SurplusFuel', int(surplus_fuel))


@when(u'CANBUS上提示主驾驶安全带示系灯为{status}')
def step_impl(context, status):
    if status == u'关闭':
        context.dorothyTestInput.sysExtEvt.set_value('DriverSeatBeltLamp', 'Off')
    elif status == u'打开':
        context.dorothyTestInput.sysExtEvt.set_value('DriverSeatBeltLamp', 'On')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上提示副驾驶安全带示系灯为{status}')
def step_impl(context, status):
    if status == u'关闭':
        context.dorothyTestInput.sysExtEvt.set_value('PassengerSeatBeltLamp', 'Off')
    elif status == u'打开':
        context.dorothyTestInput.sysExtEvt.set_value('PassengerSeatBeltLamp', 'On')
    else:
        logging.error("error status:" + status)
        raise Exception


@then(u'HUD不显示低燃油报警')
def step_impl(context):
    context.dorothyExpRes.set_value('LowFuelWaring', 'Off')
    context.dorothyActRes.mock_value('LowFuelWaring', 'Off')
    context.dorothyActRes.get_value('LowFuelWaring')
    logging.debug("context.dorothyExpRes.LowFuelWaring: " + str(context.dorothyExpRes.dist['LowFuelWaring']))
    logging.debug("context.dorothyActRes.LowFuelWaring: " + str(context.dorothyActRes.dist['LowFuelWaring']))
    assert context.dorothyActRes.dist['LowFuelWaring'] == context.dorothyExpRes.dist['LowFuelWaring']
