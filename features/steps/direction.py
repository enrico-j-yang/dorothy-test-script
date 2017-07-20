# -*- coding: utf-8 -*-
"""
dest_distance.py is step implementation file for dest_distance.feature

"""
import logging

from behave import *

@when(u'CANBUS上到下一个路口的进度值为{next_cross_progress}%')
def step_impl(context, next_cross_progress):
    context.dorothyTestInput.sysExtEvt.set_value('NextCrossProgress', next_cross_progress)


@when(u'CANBUS上转向路口类型为{next_cross_type}')
def step_impl(context, next_cross_type):
    context.dorothyTestInput.sysExtEvt.set_value('NextCrossType', next_cross_type)


@when(u'CANBUS上指北针角度为{finger_north_needle_angle}')
def step_impl(context, finger_north_needle_angle):
    context.dorothyTestInput.sysExtEvt.set_value('Angle', finger_north_needle_angle)


@then(u'HUD显示到下一个路口的进度值为{next_cross_progress}%')
def step_impl(context, next_cross_progress):
    key = 'NextCrossProgress'
    value = next_cross_progress
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示指北针方向为{finger_north_needle_direction}')
def step_impl(context, finger_north_needle_direction):
    key = '北'
    value = finger_north_needle_direction
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上到下一个路口的进度值在{duration}秒内从{int_progress}%下降到{end_progress}%')
def step_impl(context, duration, int_progress, end_progress):
    context.dorothyTestInput.sysExtEvt.set_initial_navigation_value('NextCrossProgress',
                                                                    int_progress)
    context.dorothyTestInput.sysExtEvt.set_end_navigation_value('NextCrossProgress',
                                                                end_progress)
    context.dorothyTestInput.sysExtEvt.set_signal_duration(duration)
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@then(u'HUD显示到下一个路口的进度值在{duration}秒内从{int_progress}%下降到{end_progress}%')
def step_impl(context, duration, int_progress, end_progress):
    key = 'NextCrossProgress'
    value = end_progress
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD不显示到下一个路口的进度')
def step_impl(context):
    key = 'NextCrossProgress'
    value = 'Hide'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示指北针图标消失')
def step_impl(context):
    key = 'FingerNorthNeedle'
    value = 'Hide'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]