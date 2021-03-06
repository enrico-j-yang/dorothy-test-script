# -*- coding: utf-8 -*-
"""
surplus_fuel.py is step implementation file for SurplusFuel.feature

"""
import logging

from behave import *


@when(u'CANBUS上有剩余油量为{surplus_fuel}升')
def step_impl(context, surplus_fuel):
    context.dorothyTestInput.sysExtEvt.set_value('SurplusFuel', float(surplus_fuel))


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


@given(u'HUD不显示低燃油报警')
def step_impl(context):
    context.dorothyActRes.mock_value('LowFuelWaring', 'Off')
    context.dorothyActRes.get_value('LowFuelWaring')
    if context.dorothyActRes.dist['LowFuelWaring'] == 'On':
        context.dorothyTestInput.sysExtEvt.set_value('SurplusFuel', 40)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value('LowFuelWaring', 'Off')
    context.dorothyActRes.mock_value('LowFuelWaring', 'Off')
    context.dorothyActRes.get_value('LowFuelWaring')
    logging.debug("context.dorothyExpRes.LowFuelWaring: " + str(context.dorothyExpRes.dist['LowFuelWaring']))
    logging.debug("context.dorothyActRes.LowFuelWaring: " + str(context.dorothyActRes.dist['LowFuelWaring']))
    assert context.dorothyActRes.dist['LowFuelWaring'] == context.dorothyExpRes.dist['LowFuelWaring']


@when(u'CANBUS上剩余油量在{duration}秒内从{init_fuel}升下降到{end_fuel}升')
def step_impl(context, duration, init_fuel, end_fuel):
    context.dorothyTestInput.sysExtEvt.set_initial_value('SurplusFuel', float(init_fuel))
    context.dorothyTestInput.sysExtEvt.set_end_value('SurplusFuel', float(end_fuel))
    context.dorothyTestInput.sysExtEvt.set_signal_duration(float(duration))
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@then(u'HUD显示低燃油报警')
def step_impl(context):
    context.dorothyExpRes.set_value('LowFuelWaring', 'On')
    context.dorothyActRes.mock_value('LowFuelWaring', 'On')
    context.dorothyActRes.get_value('LowFuelWaring')
    logging.debug("context.dorothyExpRes.LowFuelWaring: " + str(context.dorothyExpRes.dist['LowFuelWaring']))
    logging.debug("context.dorothyActRes.LowFuelWaring: " + str(context.dorothyActRes.dist['LowFuelWaring']))
    assert context.dorothyActRes.dist['LowFuelWaring'] == context.dorothyExpRes.dist['LowFuelWaring']


@given(u'HUD显示低燃油报警')
def step_impl(context):
    context.dorothyActRes.mock_value('LowFuelWaring', 'On')
    context.dorothyActRes.get_value('LowFuelWaring')
    if context.dorothyActRes.dist['LowFuelWaring'] == 'Off':
        context.dorothyTestInput.sysExtEvt.set_value('SurplusFuel', 7)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value('LowFuelWaring', 'On')
    context.dorothyActRes.mock_value('LowFuelWaring', 'On')
    context.dorothyActRes.get_value('LowFuelWaring')
    logging.debug("context.dorothyExpRes.LowFuelWaring: " + str(context.dorothyExpRes.dist['LowFuelWaring']))
    logging.debug("context.dorothyActRes.LowFuelWaring: " + str(context.dorothyActRes.dist['LowFuelWaring']))
    assert context.dorothyActRes.dist['LowFuelWaring'] == context.dorothyExpRes.dist['LowFuelWaring']


@when(u'CANBUS上剩余油量在{duration}秒内从{init_fuel}升上升到{end_fuel}升')
def step_impl(context, duration, init_fuel, end_fuel):
    context.dorothyTestInput.sysExtEvt.set_initial_value('SurplusFuel', float(init_fuel))
    context.dorothyTestInput.sysExtEvt.set_end_value('SurplusFuel', float(end_fuel))
    context.dorothyTestInput.sysExtEvt.set_signal_duration(float(duration))
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@then(u'CANBUS上剩余油量在{duration}秒内从{init_fuel}升下降到{end_fuel}升')
def step_impl(context, duration, init_fuel, end_fuel):
    context.dorothyExpRes.set_value('SurplusFuel', float(end_fuel))
    context.dorothyActRes.mock_value('SurplusFuel', float(end_fuel))
    context.dorothyActRes.get_value('SurplusFuel')
    logging.debug("context.dorothyExpRes.SurplusFuel: " + str(context.dorothyExpRes.dist['SurplusFuel']))
    logging.debug("context.dorothyActRes.SurplusFuel: " + str(context.dorothyActRes.dist['SurplusFuel']))
    assert context.dorothyActRes.dist['SurplusFuel'] == context.dorothyExpRes.dist['SurplusFuel']
