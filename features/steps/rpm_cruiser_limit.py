# -*- coding: utf-8 -*-
"""
speed.py is step implementation file for speed.feature

"""
import logging

from behave import *


@when(u'CANBUS上有引擎转速为{rpm}')
def step_impl(context, rpm):
    logging.debug("rpm: " + rpm)
    context.dorothyTestInput.sysExtEvt.set_value('RPM', int(rpm))


@when(u'CANBUS上有合法引擎转速')
def step_impl(context):
    context.dorothyTestInput.sysExtEvt.set_value('RPMValid', True)


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
        context.dorothyTestInput.sysExtEvt.set_value('CruiseControlStatus', 'Reserved')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上限速巡航速度为{speed}')
def step_impl(context, speed):
    context.dorothyTestInput.sysExtEvt.set_value('LimitCruiseSpeed', int(speed))


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
    context.dorothyExpRes.set_value('LimitSpeedIcon', 'On')
    context.dorothyActRes.mock_value('LimitSpeedIcon', 'On')
    context.dorothyActRes.get_value('LimitSpeedIcon')
    logging.debug("context.dorothyExpRes.LimitSpeedIcon: " + str(context.dorothyExpRes.dist['LimitSpeedIcon']))
    logging.debug("context.dorothyActRes.LimitSpeedIcon: " + str(context.dorothyActRes.dist['LimitSpeedIcon']))
    assert context.dorothyActRes.dist['LimitSpeedIcon'] == context.dorothyExpRes.dist['LimitSpeedIcon']

    context.dorothyExpRes.set_value('LimitSpeed', int(limit_speed))
    context.dorothyActRes.mock_value('LimitSpeed', int(limit_speed))
    context.dorothyActRes.get_value('LimitSpeed')
    logging.debug("context.dorothyExpRes.LimitSpeed: " + str(context.dorothyExpRes.dist['LimitSpeed']))
    logging.debug("context.dorothyActRes.LimitSpeed: " + str(context.dorothyActRes.dist['LimitSpeed']))
    assert context.dorothyActRes.dist['LimitSpeed'] == context.dorothyExpRes.dist['LimitSpeed']


@then(u'HUD显示限速图标消失')
def step_impl(context):
    context.dorothyExpRes.set_value('LimitSpeedIcon', 'Off')
    context.dorothyActRes.mock_value('LimitSpeedIcon', 'Off')
    context.dorothyActRes.get_value('LimitSpeedIcon')
    logging.debug("context.dorothyExpRes.LimitSpeedIcon: " + str(context.dorothyExpRes.dist['LimitSpeedIcon']))
    logging.debug("context.dorothyActRes.LimitSpeedIcon: " + str(context.dorothyActRes.dist['LimitSpeedIcon']))
    assert context.dorothyActRes.dist['LimitSpeedIcon'] == context.dorothyExpRes.dist['LimitSpeedIcon']


@then(u'HUD显示巡航图标，巡航{cruise_speed}km/h')
def step_impl(context, cruise_speed):
    context.dorothyExpRes.set_value('CruiseSpeedIcon', 'On')
    context.dorothyActRes.mock_value('CruiseSpeedIcon', 'On')
    context.dorothyActRes.get_value('CruiseSpeedIcon')
    logging.debug("context.dorothyExpRes.CruiseSpeedIcon: " + str(context.dorothyExpRes.dist['CruiseSpeedIcon']))
    logging.debug("context.dorothyActRes.CruiseSpeedIcon: " + str(context.dorothyActRes.dist['CruiseSpeedIcon']))
    assert context.dorothyActRes.dist['CruiseSpeedIcon'] == context.dorothyExpRes.dist['CruiseSpeedIcon']

    context.dorothyExpRes.set_value('CruiseSpeed', int(cruise_speed))
    context.dorothyActRes.mock_value('CruiseSpeed', int(cruise_speed))
    context.dorothyActRes.get_value('CruiseSpeed')
    logging.debug("context.dorothyExpRes.CruiseSpeed: " + str(context.dorothyExpRes.dist['CruiseSpeed']))
    logging.debug("context.dorothyActRes.CruiseSpeed: " + str(context.dorothyActRes.dist['CruiseSpeed']))
    assert context.dorothyActRes.dist['CruiseSpeed'] == context.dorothyExpRes.dist['CruiseSpeed']


@then(u'HUD显示巡航图标消失')
def step_impl(context):
    context.dorothyExpRes.set_value('CruiseSpeedIcon', 'Off')
    context.dorothyActRes.mock_value('CruiseSpeedIcon', 'Off')
    context.dorothyActRes.get_value('CruiseSpeedIcon')
    logging.debug("context.dorothyExpRes.CruiseSpeedIcon: " + str(context.dorothyExpRes.dist['CruiseSpeedIcon']))
    logging.debug("context.dorothyActRes.CruiseSpeedIcon: " + str(context.dorothyActRes.dist['CruiseSpeedIcon']))
    assert context.dorothyActRes.dist['CruiseSpeedIcon'] == context.dorothyExpRes.dist['CruiseSpeedIcon']
