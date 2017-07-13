# -*- coding: utf-8 -*-
"""
engine_coolant_temperature.py is step implementation file for engine_coolant_temperature.feature

"""
import logging

from behave import *


@when(u'CANBUS上有引擎冷却剂温度为{temperature}度')
def step_impl(context, temperature):
    context.dorothyTestInput.sysExtEvt.set_value('ECT', float(temperature))


@when(u'CANBUS上引擎冷却剂温度值状态为合法')
def step_impl(context):
    context.dorothyTestInput.sysExtEvt.set_value('ECTValid', "Valid")


@then(u'HUD不显示高水温报警')
def step_impl(context):
    key = 'ECTIcon'
    value = 'Off'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@given(u'HUD不显示高水温报警')
def step_impl(context):
    key = 'ECTIcon'
    value = 'Off'
    context.dorothyActRes.mock_value(key, 'Off')
    context.dorothyActRes.get_value(key)
    if context.dorothyActRes.dist[key] == 'On':
        context.dorothyTestInput.sysExtEvt.set_value('ECT', 40)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上引擎冷却剂温度在{duration}秒内从{init_temp}度增加到{end_temp}度')
def step_impl(context, duration, init_temp, end_temp):
    context.dorothyTestInput.sysExtEvt.set_initial_value('ECT', float(init_temp))
    context.dorothyTestInput.sysExtEvt.set_end_value('ECT', float(end_temp))
    context.dorothyTestInput.sysExtEvt.set_signal_duration(float(duration))
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@then(u'HUD显示高水温报警')
def step_impl(context):
    key = 'ECTIcon'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@given(u'HUD显示高水温报警')
def step_impl(context):
    key = 'ECTIcon'
    value = 'On'
    context.dorothyActRes.mock_value(key, 'On')
    context.dorothyActRes.get_value(key)
    if context.dorothyActRes.dist[key] == 'Off':
        context.dorothyTestInput.sysExtEvt.set_value('ECT', 100)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()
        
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上引擎冷却剂温度在{duration}秒内从{init_temp}度下降到{end_temp}度')
def step_impl(context, duration, init_temp, end_temp):
    context.dorothyTestInput.sysExtEvt.set_initial_value('ECT', float(init_temp))
    context.dorothyTestInput.sysExtEvt.set_end_value('ECT', float(end_temp))
    context.dorothyTestInput.sysExtEvt.set_signal_duration(float(duration))
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@when(u'CANBUS上有引擎冷却剂温度为{invalid_temp}')
def step_impl(context, invalid_temp):
    context.dorothyTestInput.sysExtEvt.set_value('ECT', float(invalid_temp))
