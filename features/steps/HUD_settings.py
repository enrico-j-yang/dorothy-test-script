# -*- coding: utf-8 -*-
"""
HUD_settings.py is step implementation file for HUD_settings.feature

"""
import logging

from behave import *


@when(u'CANBUS上显示模式为{status}')
def step_impl(context, status):
    if status == u'默认':
        context.dorothyTestInput.sysExtEvt.set_value('SetDisplayMode', 'Default')
    elif status == u'模式2':
        context.dorothyTestInput.sysExtEvt.set_value('SetDisplayMode', 'Mode2')
    elif status == u'保留值':
        context.dorothyTestInput.sysExtEvt.set_value('SetDisplayMode', 'Reserved')
    else:
        logging.error("error status:" + status)
        raise Exception


@then(u'HUD不显示到下一个路口的进度值')
def step_impl(context):
    raise NotImplementedError(u'STEP: Then HUD不显示到下一个路口的进度值')


@then(u'HUD不显示指北针方向')
def step_impl(context):
    key = 'FingerNorthNeedle'
    value = 'Off'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@given(u'HUD的显示模式为默认模式')
def step_impl(context):
    key = 'SetDisplayMode'
    value = 'Default'
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    if context.dorothyActRes.dist[key] != 'Default':
        context.dorothyTestInput.sysExtEvt.set_value('SetDisplayMode', value)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@given(u'HUD显示亮度为默认')
def step_impl(context):
    key = 'SetBrightness'
    value = 'Not Change'
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    if context.dorothyActRes.dist[key] != 'Not Change':
        context.dorothyTestInput.sysExtEvt.set_value('SetBrightness', value)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上HUD亮度设置为{status}')
def step_impl(context, status):
    if status == u'默认':
        context.dorothyTestInput.sysExtEvt.set_value('SetBrightness', 'Not Change')
    elif status == u'增强':
        context.dorothyTestInput.sysExtEvt.set_value('SetBrightness', 'Enhance Brightness')
    elif status == u'减弱':
        context.dorothyTestInput.sysExtEvt.set_value('SetBrightness', 'Reduce Brightness')
    elif status == u'保留值':
        context.dorothyTestInput.sysExtEvt.set_value('SetBrightness', 'Reserved')


@then(u'HUD显示亮度不改变')
def step_impl(context):
    key = 'SetBrightness'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示亮度增强')
def step_impl(context):
    key = 'SetBrightness'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示亮度减弱')
def step_impl(context):
    key = 'SetBrightness'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@given(u'HUD角度设置为默认')
def step_impl(context):
    key = 'SetCombinerAngle'
    value = 'Not Change'
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    if context.dorothyActRes.dist[key] != 'Not Change':
        context.dorothyTestInput.sysExtEvt.set_value('SetCombinerAngle', value)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'CANBUS上HUD角度设置为{status}')
def step_impl(context, status):
    if status == u'默认':
        context.dorothyTestInput.sysExtEvt.set_value('SetCombinerAngle', 'Not Change')
    elif status == u'增加':
        context.dorothyTestInput.sysExtEvt.set_value('SetCombinerAngle', 'Increase Angle')
    elif status == u'减少':
        context.dorothyTestInput.sysExtEvt.set_value('SetCombinerAngle', 'Reduce Angle')
    elif status == u'保留值':
        context.dorothyTestInput.sysExtEvt.set_value('SetCombinerAngle', 'Reserved')


@then(u'HUD显示角度不改变')
def step_impl(context):
    key = 'SetCombinerAngle'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示角度增加')
def step_impl(context):
    key = 'SetCombinerAngle'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示角度减少')
def step_impl(context):
    key = 'SetCombinerAngle'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]
