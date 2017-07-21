# -*- coding: utf-8 -*-
"""
dest_distance.py is step implementation file for dest_distance.feature

"""
import logging

from behave import *


@when(u'CANBUS上目的地距离值为{dest_distance_in_km}km')
def step_impl(context, dest_distance_in_km):
    context.dorothyTestInput.sysExtEvt.set_value('DestDistance', dest_distance_in_km)


@when(u'CANBUS上到达目的地剩余时间值为{hour}h{minute}m')
def step_impl(context, hour, minute):
    context.dorothyTestInput.sysExtEvt.set_value('DestHour', hour)
    context.dorothyTestInput.sysExtEvt.set_value('DestMinute', minute)


@when(u'CANBUS上下一个路口的距离值为{next_cross_distance_in_km}km')
def step_impl(context, next_cross_distance_in_km):
    context.dorothyTestInput.sysExtEvt.set_value('NextCrossDistance', float(next_cross_distance_in_km) * 1000)


@then(u'HUD显示目的地距离为{dest_distance_in_km}km')
def step_impl(context, dest_distance_in_km):
    key = 'DestDistance'
    value = dest_distance_in_km
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示到达目的地剩余时间为{hour}h{minute}m')
def step_impl(context, hour, minute):
    key = 'DestHour'
    value = hour
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]

    key = 'DestMinute'
    value = minute
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示下一个路口的距离为{next_cross_distance_in_km}km')
def step_impl(context, next_cross_distance_in_km):
    key = 'NextCrossDistance'
    value = next_cross_distance_in_km
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上目的地距离值为{dest_distance_in_m}m')
def step_impl(context, dest_distance_in_m):
    context.dorothyTestInput.sysExtEvt.set_value('DestDistance', float(dest_distance_in_m) / 1000)


@when(u'CANBUS上到达目的地剩余时间值为{minute}m')
def step_impl(context, minute):
    context.dorothyTestInput.sysExtEvt.set_value('DestHour', 0)
    context.dorothyTestInput.sysExtEvt.set_value('DestMinute', minute)


@when(u'CANBUS上下一个路口的距离值为{next_cross_distance_in_m}m')
def step_impl(context, next_cross_distance_in_m):
    context.dorothyTestInput.sysExtEvt.set_value('NextCrossDistance', next_cross_distance_in_m)


@then(u'HUD显示目的地距离为{dest_distance_in_m}m')
def step_impl(context, dest_distance_in_m):
    key = 'DestDistance'
    value = float(dest_distance_in_m) / 1000
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示到达目的地剩余时间为{minute}m')
def step_impl(context, minute):
    key = 'DestMinute'
    value = minute
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示下一个路口的距离为{next_cross_distance_in_m}m')
def step_impl(context, next_cross_distance_in_m):
    key = 'NextCrossDistance'
    value = next_cross_distance_in_m
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上速度在{duration}秒内从{init_distance_in_km}km减小到{end_distance_in_m}m')
def step_impl(context, duration, init_distance_in_km, end_distance_in_m):
    context.dorothyTestInput.sysExtEvt.set_initial_navigation_value('DestDistance', init_distance_in_km)
    context.dorothyTestInput.sysExtEvt.set_end_navigation_value('DestDistance', float(end_distance_in_m) / 1000)
    context.dorothyTestInput.sysExtEvt.set_signal_duration(duration)
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@when(u'CANBUS上速度在{duration}秒内从{init_distance_in_m}m增加到{end_distance_in_km}km')
def step_impl(context, duration, init_distance_in_m, end_distance_in_km):
    context.dorothyTestInput.sysExtEvt.set_initial_navigation_value('DestDistance', float(init_distance_in_m) / 1000)
    context.dorothyTestInput.sysExtEvt.set_end_navigation_value('DestDistance', end_distance_in_km)
    context.dorothyTestInput.sysExtEvt.set_signal_duration(duration)
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@then(u'HUD不显示目的地距离')
def step_impl(context):
    key = 'DestDistance'
    value = 'Hide'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD不显示到达目的地剩余时间')
def step_impl(context):
    key = 'DestHour'
    value = 'Hide'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]

    key = 'DestMinute'
    value = 'Hide'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD不显示下一个路口的距离')
def step_impl(context):
    key = 'NextCrossDistance'
    value = 'Hide'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上下一个路口的距离在{duration}秒内从{next_cross_distance_in_km}km减小到{next_cross_distance_in_m}m')
def step_impl(context, duration, next_cross_distance_in_km, next_cross_distance_in_m):
    context.dorothyTestInput.sysExtEvt.set_initial_navigation_value('NextCrossDistance',
                                                                    float(next_cross_distance_in_km) * 1000)
    context.dorothyTestInput.sysExtEvt.set_end_navigation_value('NextCrossDistance',
                                                                next_cross_distance_in_m)
    context.dorothyTestInput.sysExtEvt.set_signal_duration(duration)
    context.dorothyTestInput.sysExtEvt.start_generate_signal()


@when(u'CANBUS上下一个路口的距离在{duration}秒内从{next_cross_distance_in_m}m增加到{next_cross_distance_in_km}km')
def step_impl(context, duration, next_cross_distance_in_m, next_cross_distance_in_km):
    context.dorothyTestInput.sysExtEvt.set_initial_navigation_value('NextCrossDistance',
                                                                    next_cross_distance_in_m)
    context.dorothyTestInput.sysExtEvt.set_end_navigation_value('NextCrossDistance',
                                                                float(next_cross_distance_in_km) * 1000)
    context.dorothyTestInput.sysExtEvt.set_signal_duration(duration)
    context.dorothyTestInput.sysExtEvt.start_generate_signal()
