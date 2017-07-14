# -*- coding: utf-8 -*-
"""
rpm_cruise_limit.py is step implementation file for rpm_cruise_limit.feature

"""
import logging

from behave import *


@when(u'CANBUS上有引擎转速为{rpm}')
def step_impl(context, rpm):
    logging.debug("rpm: " + rpm)
    context.dorothyTestInput.sysExtEvt.set_value('RPM', float(rpm))


@when(u'CANBUS上有合法引擎转速')
def step_impl(context):
    context.dorothyTestInput.sysExtEvt.set_value('RPMValid', 'Valid')


@when(u'CANBUS上限速控制状态为{status}')
def step_impl(context, status):
    if status == u'关闭':
        context.dorothyTestInput.sysExtEvt.set_value('LimitControlStatus', 'Off')
    elif status == u'准备中':
        context.dorothyTestInput.sysExtEvt.set_value('LimitControlStatus', 'Standby')
    elif status == u'激活':
        context.dorothyTestInput.sysExtEvt.set_value('LimitControlStatus', 'Active')
    elif status == u'保留值':
        context.dorothyTestInput.sysExtEvt.set_value('LimitControlStatus', 'Reserved')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上巡航控制状态为{status}')
def step_impl(context, status):
    if status == u'关闭':
        context.dorothyTestInput.sysExtEvt.set_value('CruiseControlStatus', 'Off')
    elif status == u'准备中':
        context.dorothyTestInput.sysExtEvt.set_value('CruiseControlStatus', 'Standby')
    elif status == u'激活':
        context.dorothyTestInput.sysExtEvt.set_value('CruiseControlStatus', 'Active')
    elif status == u'巡航超车':
        context.dorothyTestInput.sysExtEvt.set_value('CruiseControlStatus', 'Override')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上限速巡航速度为{speed}')
def step_impl(context, speed):
    context.dorothyTestInput.sysExtEvt.set_value('LimitCruiseSpeed', float(speed))


@when(u'CANBUS上发动机状态信息为{status}')
def step_impl(context, status):
    if status == u'关闭':
        context.dorothyTestInput.sysExtEvt.set_value('EngineRunningStatus', 'EngineOff')
    elif status == u'上电':
        context.dorothyTestInput.sysExtEvt.set_value('EngineRunningStatus', 'PowerOn')
    elif status == u'准备中':
        context.dorothyTestInput.sysExtEvt.set_value('EngineRunningStatus', 'Cranking')
    elif status == u'运行中':
        context.dorothyTestInput.sysExtEvt.set_value('EngineRunningStatus', 'Running')
    elif status == u'停止中':
        context.dorothyTestInput.sysExtEvt.set_value('EngineRunningStatus', 'Stopping')
    elif status == u'已停止':
        context.dorothyTestInput.sysExtEvt.set_value('EngineRunningStatus', 'Stopped')
    elif status == u'保留1':
        context.dorothyTestInput.sysExtEvt.set_value('EngineRunningStatus', 'Reserved1')
    elif status == u'保留2':
        context.dorothyTestInput.sysExtEvt.set_value('EngineRunningStatus', 'Reserved2')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上限速主开关灯指示为{status}')
def step_impl(context, status):
    if status == u'关闭':
        context.dorothyTestInput.sysExtEvt.set_value('LimitIndicator', 'Off')
    elif status == u'打开':
        context.dorothyTestInput.sysExtEvt.set_value('LimitIndicator', 'On')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上限速激活状态灯为{status}')
def step_impl(context, status):
    if status == u'关闭':
        context.dorothyTestInput.sysExtEvt.set_value('LimitUnavailDisplay', 'Off')
    elif status == u'打开':
        context.dorothyTestInput.sysExtEvt.set_value('LimitUnavailDisplay', 'On')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上巡航主开关灯指示为{status}')
def step_impl(context, status):
    if status == u'关闭':
        context.dorothyTestInput.sysExtEvt.set_value('CruiseIndicator', 'Off')
    elif status == u'打开':
        context.dorothyTestInput.sysExtEvt.set_value('CruiseIndicator', 'On')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上巡航激活状态灯为{status}')
def step_impl(context, status):
    if status == u'关闭':
        context.dorothyTestInput.sysExtEvt.set_value('CruiseUnavailDisplay', 'Off')
    elif status == u'打开':
        context.dorothyTestInput.sysExtEvt.set_value('CruiseUnavailDisplay', 'On')
    else:
        logging.error("error status:" + status)
        raise Exception


@then(u'HUD显示限速图标，限速{limit_speed}km/h')
def step_impl(context, limit_speed):
    key = 'LimitSpeedIcon'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]

    key = 'LimitSpeed'
    value = limit_speed
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示限速图标消失')
def step_impl(context):
    key = 'LimitSpeedIcon'
    value = 'Off'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示巡航图标，巡航{cruise_speed}km/h')
def step_impl(context, cruise_speed):
    key = 'CruiseSpeedIcon'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]

    key = 'CruiseSpeed'
    value = cruise_speed
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示巡航图标消失')
def step_impl(context):
    key = 'CruiseSpeedIcon'
    value = 'Off'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]
