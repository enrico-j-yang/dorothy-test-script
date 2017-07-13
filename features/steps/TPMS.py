# -*- coding: utf-8 -*-
"""
speed.py is step implementation file for speed.feature

"""
import logging

from behave import *


@when(u'CANBUS上胎压报警状态为{status}')
def step_impl(context, status):
    if status == u'正常':
        context.dorothyTestInput.sysExtEvt.set_value('SystemStatus', 'Normal')
    elif status == u'系统自检':
        context.dorothyTestInput.sysExtEvt.set_value('SystemStatus', 'SelfCheck')
    elif status == u'系统故障':
        context.dorothyTestInput.sysExtEvt.set_value('SystemStatus', 'SystemFailure')
    elif status == u'预留':
        context.dorothyTestInput.sysExtEvt.set_value('SystemStatus', 'Reserved')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上轮位为{status}')
def step_impl(context, status):
    if status == u'右后轮胎':
        context.dorothyTestInput.sysExtEvt.set_value('TireID', 'RightRear')
    elif status == u'右前轮胎':
        context.dorothyTestInput.sysExtEvt.set_value('TireID', 'RightFront')
    elif status == u'左后轮胎':
        context.dorothyTestInput.sysExtEvt.set_value('TireID', 'LeftRear')
    elif status == u'左前轮胎':
        context.dorothyTestInput.sysExtEvt.set_value('TireID', 'LeftFront')
    elif status == u'预留':
        context.dorothyTestInput.sysExtEvt.set_value('TireID', 'Reserved')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上单个胎压信号为{status}')
def step_impl(context, status):
    if status == u'正常':
        context.dorothyTestInput.sysExtEvt.set_value('TireInformation', 'Valid')
    elif status == u'信号异常':
        context.dorothyTestInput.sysExtEvt.set_value('TireInformation', 'Invalid')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上单个轮胎漏气为{status}')
def step_impl(context, status):
    if status == u'正常':
        context.dorothyTestInput.sysExtEvt.set_value('TireLeakage', 'Normal')
    elif status == u'快速漏气':
        context.dorothyTestInput.sysExtEvt.set_value('TireLeakage', 'FastLeak')
    elif status == u'慢速漏气':
        context.dorothyTestInput.sysExtEvt.set_value('TireLeakage', 'SlowLeak')
    elif status == u'预留':
        context.dorothyTestInput.sysExtEvt.set_value('TireLeakage', 'Reserved')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上单个轮胎学习状态为{status}')
def step_impl(context, status):
    if status == u'未学习':
        context.dorothyTestInput.sysExtEvt.set_value('LearningStatus', 'NoLearn')
    elif status == u'学习中':
        context.dorothyTestInput.sysExtEvt.set_value('LearningStatus', 'Learning')
    elif status == u'学习完成':
        context.dorothyTestInput.sysExtEvt.set_value('LearningStatus', 'LearnCompleted')
    elif status == u'学习失败':
        context.dorothyTestInput.sysExtEvt.set_value('LearningStatus', 'LearnFailed')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上单个胎压状态为{status}')
def step_impl(context, status):
    if status == u'正常':
        context.dorothyTestInput.sysExtEvt.set_value('TirePressureStatus', 'Normal')
    elif status == u'过压':
        context.dorothyTestInput.sysExtEvt.set_value('TirePressureStatus', 'OverPressure')
    elif status == u'欠压':
        context.dorothyTestInput.sysExtEvt.set_value('TirePressureStatus', 'NnderPressure')
    elif status == u'预留':
        context.dorothyTestInput.sysExtEvt.set_value('TirePressureStatus', 'Reserved')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上单个轮胎温度状态为{status}')
def step_impl(context, status):
    if status == u'正常':
        context.dorothyTestInput.sysExtEvt.set_value('TireTemperatureStatus', 'Normal')
    elif status == u'超高温':
        context.dorothyTestInput.sysExtEvt.set_value('TireTemperatureStatus', 'SuperHighTemperature')
    elif status == u'高温':
        context.dorothyTestInput.sysExtEvt.set_value('TireTemperatureStatus', 'HighTemperature')
    elif status == u'预留':
        context.dorothyTestInput.sysExtEvt.set_value('TireTemperatureStatus', 'Reserved')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上单个轮胎压力值为{pressure}')
def step_impl(context, pressure):
    context.dorothyTestInput.sysExtEvt.set_value('TirePressure', pressure)


@when(u'CANBUS上单个轮胎温度值为{temperature}')
def step_impl(context, temperature):
    context.dorothyTestInput.sysExtEvt.set_value('TireTemperature', temperature)


@when(u'CANBUS上单个胎压监测模块电池电量为{status}')
def step_impl(context, status):
    if status == u'非法':
        context.dorothyTestInput.sysExtEvt.set_value('TireBatteryPower', 'Invalid')
    elif status == u'预留':
        context.dorothyTestInput.sysExtEvt.set_value('TireBatteryPower', 'Reserved')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上单个轮胎电池电量状态为{status}')
def step_impl(context, status):
    if status == u'正常':
        context.dorothyTestInput.sysExtEvt.set_value('TireBatteryPowerSts', 'Normal')
    elif status == u'低电量':
        context.dorothyTestInput.sysExtEvt.set_value('TireBatteryPowerSts', 'LowBattery')
    elif status == u'预留':
        context.dorothyTestInput.sysExtEvt.set_value('TireTemperatureStatus', 'Reserved')
    else:
        logging.error("error status:" + status)
        raise Exception


@then(u'HUD不显示胎压报警')
def step_impl(context):
    context.dorothyExpRes.set_value('TirePressureAlarm', 'Off')
    context.dorothyActRes.mock_value('TirePressureAlarm', 'Off')
    context.dorothyActRes.get_value('TirePressureAlarm')
    logging.debug("context.dorothyExpRes.TirePressureAlarm: " + str(context.dorothyExpRes.dist['TirePressureAlarm']))
    logging.debug("context.dorothyActRes.TirePressureAlarm: " + str(context.dorothyActRes.dist['TirePressureAlarm']))
    assert context.dorothyActRes.dist['TirePressureAlarm'] == context.dorothyExpRes.dist['TirePressureAlarm']


@then(u'HUD显示胎压报警')
def step_impl(context):
    context.dorothyExpRes.set_value('TirePressureAlarm', 'On')
    context.dorothyActRes.mock_value('TirePressureAlarm', 'On')
    context.dorothyActRes.get_value('TirePressureAlarm')
    logging.debug("context.dorothyExpRes.TirePressureAlarm: " + str(context.dorothyExpRes.dist['TirePressureAlarm']))
    logging.debug("context.dorothyActRes.TirePressureAlarm: " + str(context.dorothyActRes.dist['TirePressureAlarm']))
    assert context.dorothyActRes.dist['TirePressureAlarm'] == context.dorothyExpRes.dist['TirePressureAlarm']


