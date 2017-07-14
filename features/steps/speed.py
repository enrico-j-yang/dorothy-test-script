# -*- coding: utf-8 -*-
"""
speed.py is step implementation file for speed.feature

"""
import logging
from time import sleep

from behave import *


@when(u'CANBUS上有速度为{speed}km/h')
def step_impl(context, speed):
    logging.debug("speed: " + speed)
    context.dorothyTestInput.sysExtEvt.set_value('Speed', speed)


@when(u'CANBUS上信号持续{duration}秒')
def step_impl(context, duration):
    context.dorothyTestInput.sysExtEvt.set_signal_duration(duration)
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@then(u'HUD显示速度为{speed}km/h')
def step_impl(context, speed):
    key = 'Speed'
    value = speed
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上速度在{duration}秒内从{init_speed}km/h增加到{end_speed}km/h')
def step_impl(context, duration, init_speed, end_speed):
    context.dorothyTestInput.sysExtEvt.set_initial_value('Speed', init_speed)
    context.dorothyTestInput.sysExtEvt.set_end_value('Speed', end_speed)
    context.dorothyTestInput.sysExtEvt.set_signal_duration(duration)
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@then(u'HUD显示速度在{duration}秒内从{init_speed}km/h增加到{end_speed}km/h')
def step_impl(context, duration, init_speed, end_speed):
    context.dorothyExpRes.set_value('Speed', end_speed)
    context.dorothyActRes.mock_value('Speed', end_speed)
    context.dorothyActRes.get_value('Speed')
    logging.debug("context.dorothyExpRes.Speed: " + str(context.dorothyExpRes.dist['Speed']))
    logging.debug("context.dorothyActRes.Speed: " + str(context.dorothyActRes.dist['Speed']))
    assert context.dorothyActRes.dist['Speed'] == context.dorothyExpRes.dist['Speed']


@when(u'CANBUS上速度在{duration}秒内从{init_speed}km/h下降到{end_speed}km/h')
def step_impl(context, duration, init_speed, end_speed):
    context.dorothyTestInput.sysExtEvt.set_initial_value('Speed', init_speed)
    context.dorothyTestInput.sysExtEvt.set_end_value('Speed', end_speed)
    context.dorothyTestInput.sysExtEvt.set_signal_duration(duration)
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@then(u'HUD显示速度在{duration}秒内从{init_speed}km/h下降到{end_speed}km/h')
def step_impl(context, duration, init_speed, end_speed):
    key = 'Speed'
    value = end_speed
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上有速度为{speed}')
def step_impl(context, speed):
    logging.debug("speed: " + speed)
    context.dorothyTestInput.sysExtEvt.set_value('Speed', speed)


@when(u'CANBUS上信号断开{duration}秒')
def step_impl(context, duration):
    context.dorothyTestInput.sysExtEvt.stop_generate_signal()
    sleep(float(duration))
