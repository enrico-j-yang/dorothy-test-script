# -*- coding: utf-8 -*-
"""
current_road_name.py is step implementation file for current_road_name.feature

"""
import logging

from behave import *


@when(u'CANBUS上当前道路名称数据首帧为{road_name}')
def step_impl(context, road_name):
    context.dorothyTestInput.sysExtEvt.set_value('RoadName1', road_name)


@when(u'CANBUS上当前道路名称数据第2帧为结束帧为{road_name}')
def step_impl(context, road_name):
    context.dorothyTestInput.sysExtEvt.set_value('RoadName2', road_name)


@then(u'HUD显示当前道路名称为{road_name}')
def step_impl(context, road_name):
    key = 'RoadName'
    value = road_name
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]
