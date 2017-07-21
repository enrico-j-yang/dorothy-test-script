# -*- coding: utf-8 -*-
"""
current_road_name.py is step implementation file for current_road_name.feature

"""
import logging

from behave import *


@when(u'CANBUS上当前道路名称数据第{frame_number}帧{frame_type}帧为{road_name}')
def step_impl(context, frame_number, frame_type, road_name):
    if frame_type == u'首':
        context.dorothyTestInput.sysExtEvt.set_value('RoadName' + frame_number, '1:' + road_name)
    elif frame_type == u'连续':
        context.dorothyTestInput.sysExtEvt.set_value('RoadName' + frame_number, '2:' + road_name)
    elif frame_type == u'结束':
        context.dorothyTestInput.sysExtEvt.set_value('RoadName' + frame_number, '3:' + road_name)
    else:
        logging.error("unknown frame type")
        raise Exception


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


@then(u'HUD滚动显示当前道路名称为{road_name}')
def step_impl(context, road_name):
    key = 'RoadName'
    value = road_name
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]

    key = 'RoadNameRolling'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@given(u'HUD显示当前道路名称为{road_name}')
def step_impl(context, road_name):
    key = 'RoadName'
    value = road_name
    context.dorothyActRes.mock_value(key, road_name + "1")
    context.dorothyActRes.get_value(key)
    if context.dorothyActRes.dist[key] != road_name:
        # 路名3个分一组数据包,记录总共有需要多少组数据包
        name_size = int(len(road_name) / 3) + 1
        for i in range(0, int(name_size)):
            # 每个字放入的起始字节位和结束字节位
            s_index = i * 3
            e_index = len(road_name) if s_index + 3 > len(road_name) else s_index + 3
            part_name = road_name[s_index:e_index]
            # 如果e_index < s_index + 3 则该数据包为结束包
            if i == name_size - 1:
                context.dorothyTestInput.sysExtEvt.set_value('RoadName' + str(i + 1), '3:' + part_name)
            elif 0 < i < int(name_size) - 1:
                context.dorothyTestInput.sysExtEvt.set_value('RoadName' + str(i + 1), '2:' + part_name)
            elif i == 0:
                context.dorothyTestInput.sysExtEvt.set_value('RoadName' + str(i + 1), '1:' + part_name)
            else:
                logging.error("unknown frame type")
                raise Exception
        context.dorothyTestInput.sysExtEvt.set_signal_duration(0.2)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上当前道路名称数据单帧')
def step_impl(context):
    context.dorothyTestInput.sysExtEvt.set_value('RoadNameHide', 'Hide')


@then(u'HUD不显示当前道路名称')
def step_impl(context):
    key = 'RoadName'
    value = 'Hide'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上当前道路名称数据0xFFFF')
def step_impl(context):
    context.dorothyTestInput.sysExtEvt.set_value('RoadName1', '0:0xFFFF')


@when(u'CANBUS上当前道路名称数据为{road_name}')
def step_impl(context, road_name):
    # 路名3个分一组数据包,记录总共有需要多少组数据包
    name_size = int(len(road_name) / 3) + 1
    for i in range(0, int(name_size)):
        # 每个字放入的起始字节位和结束字节位
        s_index = i * 3
        e_index = len(road_name) if s_index + 3 > len(road_name) else s_index + 3
        part_name = road_name[s_index:e_index]
        # 如果e_index < s_index + 3 则该数据包为结束包
        if i == name_size - 1:
            context.dorothyTestInput.sysExtEvt.set_value('RoadName' + str(i + 1), '3:' + part_name)
        elif 0 < i < int(name_size) - 1:
            context.dorothyTestInput.sysExtEvt.set_value('RoadName' + str(i + 1), '2:' + part_name)
        elif i == 0:
            context.dorothyTestInput.sysExtEvt.set_value('RoadName' + str(i + 1), '1:' + part_name)
        else:
            logging.error("unknown frame type")
            raise Exception
