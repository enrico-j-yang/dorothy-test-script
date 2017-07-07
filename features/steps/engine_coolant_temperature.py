# -*- coding: utf-8 -*-
"""
engine_coolant_temperature.py is step implementation file for engine_coolant_temperature.feature

"""
import logging

from behave import *


@when(u'CANBUS上有引擎冷却剂温度为{temperature}度')
def step_impl(context, temperature):
    context.dorothyTestInput.sysExtEvt.set_value('ECT', int(temperature))


@when(u'CANBUS上引擎冷却剂温度值状态为合法')
def step_impl(context):
    context.dorothyTestInput.sysExtEvt.set_value('ECTValid', True)


@then(u'HUD不显示高水温报警')
def step_impl(context):
    context.dorothyExpRes.set_value('ECTIcon', 'Off')
    context.dorothyActRes.mock_value('ECTIcon', 'Off')
    context.dorothyActRes.get_value('ECTIcon')
    logging.debug("context.dorothyExpRes.ECTIcon: " + str(context.dorothyExpRes.dist['ECTIcon']))
    logging.debug("context.dorothyActRes.ECTIcon: " + str(context.dorothyActRes.dist['ECTIcon']))
    assert context.dorothyActRes.dist['ECTIcon'] == context.dorothyExpRes.dist['ECTIcon']


@given(u'HUD不显示高水温报警')
def step_impl(context):
    context.dorothyActRes.mock_value('ECTIcon', 'Off')
    context.dorothyActRes.get_value('ECTIcon')
    if context.dorothyActRes.dist['ECTIcon'] == 'On':
        context.dorothyTestInput.sysExtEvt.set_value('ECT', 40)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value('ECTIcon', 'Off')
    context.dorothyActRes.mock_value('ECTIcon', 'Off')
    context.dorothyActRes.get_value('ECTIcon')
    logging.debug("context.dorothyExpRes.ECTIcon: " + str(context.dorothyExpRes.dist['ECTIcon']))
    logging.debug("context.dorothyActRes.ECTIcon: " + str(context.dorothyActRes.dist['ECTIcon']))
    assert context.dorothyActRes.dist['ECTIcon'] == context.dorothyExpRes.dist['ECTIcon']


@when(u'CANBUS上引擎冷却剂温度在{duration}秒内从{init_temp}度增加到{end_temp}度')
def step_impl(context, duration, init_temp, end_temp):
    context.dorothyTestInput.sysExtEvt.set_initial_temp(int(init_temp))
    context.dorothyTestInput.sysExtEvt.set_end_temp(int(end_temp))
    context.dorothyTestInput.sysExtEvt.set_signal_duration(int(duration))
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@then(u'HUD显示高水温报警')
def step_impl(context):
    context.dorothyExpRes.set_value('ECTIcon', 'On')
    context.dorothyActRes.mock_value('ECTIcon', 'On')
    context.dorothyActRes.get_value('ECTIcon')
    logging.debug("context.dorothyExpRes.ECTIcon: " + str(context.dorothyExpRes.dist['ECTIcon']))
    logging.debug("context.dorothyActRes.ECTIcon: " + str(context.dorothyActRes.dist['ECTIcon']))
    assert context.dorothyActRes.dist['ECTIcon'] == context.dorothyExpRes.dist['ECTIcon']


@given(u'HUD显示高水温报警')
def step_impl(context):
    context.dorothyActRes.mock_value('ECTIcon', 'On')
    context.dorothyActRes.get_value('ECTIcon')
    if context.dorothyActRes.dist['ECTIcon'] == 'Off':
        context.dorothyTestInput.sysExtEvt.set_value('ECT', 100)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value('ECTIcon', 'On')
    context.dorothyActRes.mock_value('ECTIcon', 'On')
    context.dorothyActRes.get_value('ECTIcon')
    logging.debug("context.dorothyExpRes.ECTIcon: " + str(context.dorothyExpRes.dist['ECTIcon']))
    logging.debug("context.dorothyActRes.ECTIcon: " + str(context.dorothyActRes.dist['ECTIcon']))
    assert context.dorothyActRes.dist['ECTIcon'] == context.dorothyExpRes.dist['ECTIcon']


@when(u'CANBUS上引擎冷却剂温度在{duration}秒内从{init_temp}度下降到{end_temp}度')
def step_impl(context, duration, init_temp, end_temp):
    context.dorothyTestInput.sysExtEvt.set_initial_temp(int(init_temp))
    context.dorothyTestInput.sysExtEvt.set_end_temp(int(end_temp))
    context.dorothyTestInput.sysExtEvt.set_signal_duration(int(duration))
    context.dorothyTestInput.sysExtEvt.start_generate_signal()

@when(u'CANBUS上有引擎冷却剂温度为{invalid_temp}')
def step_impl(context, invalid_temp):
    context.dorothyTestInput.sysExtEvt.set_value('ECT', int(invalid_temp))
