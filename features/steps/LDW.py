# -*- coding: utf-8 -*-
"""
LDW.py is step implementation file for speed.feature

"""
import logging

from behave import *


@given(u'HUD车道偏离状态为系统激活')
def step_impl(context):
    key = 'LDWOperationStatus'
    value = 'Active'
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    if context.dorothyActRes.dist[key] != 'Active':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', value)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@given(u'HUD左车道偏离报警为检测到车道')
def step_impl(context):
    key = 'LDWLeftWarningStatus'
    value = 'Tracking'
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    if context.dorothyActRes.dist[key] != 'Tracking':
        context.dorothyTestInput.sysExtEvt.set_value('LeftWarningStatus', value)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@given(u'HUD右车道偏离报警为检测到车道')
def step_impl(context):
    key = 'LDWRightWarningStatus'
    value = 'Tracking'
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    if context.dorothyActRes.dist[key] != 'Tracking':
        context.dorothyTestInput.sysExtEvt.set_value('RightWarningStatus', value)
        context.dorothyTestInput.sysExtEvt.set_signal_duration(1)
        context.dorothyTestInput.sysExtEvt.start_generate_signal()

    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@when(u'HUD车道偏离状态为{status}')
def step_impl(context, status):
    if status == u'关闭':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Off')
    elif status == u'待机':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Standby')
    elif status == u'系统激活':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Active')
    elif status == u'故障状态':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Fault')
    elif status == u'标定状态':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Calculation')
    elif status == u'摄像头覆盖':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Camera Cover')
    elif status == u'保留值':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Reserve')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上车道偏离状态为{status}')
def step_impl(context, status):
    if status == u'关闭':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Off')
    elif status == u'待机':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Standby')
    elif status == u'系统激活':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Active')
    elif status == u'故障状态':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Fault')
    elif status == u'标定状态':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Calculation')
    elif status == u'摄像头覆盖':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Camera Cover')
    elif status == u'保留值':
        context.dorothyTestInput.sysExtEvt.set_value('OperationStatus', 'Reserve')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上右车道偏离报警为{status}')
def step_impl(context, status):
    if status == u'无显示':
        context.dorothyTestInput.sysExtEvt.set_value('RightWarningStatus', 'No Display')
    elif status == u'检测到车道':
        context.dorothyTestInput.sysExtEvt.set_value('RightWarningStatus', 'Tracking')
    elif status == u'保留值':
        context.dorothyTestInput.sysExtEvt.set_value('RightWarningStatus', 'Reserved')
    elif status == u'警告':
        context.dorothyTestInput.sysExtEvt.set_value('RightWarningStatus', 'Warning')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上左车道偏离报警为{status}')
def step_impl(context, status):
    if status == u'无显示':
        context.dorothyTestInput.sysExtEvt.set_value('LeftWarningStatus', 'No Display')
    elif status == u'检测到车道':
        context.dorothyTestInput.sysExtEvt.set_value('LeftWarningStatus', 'Tracking')
    elif status == u'保留值':
        context.dorothyTestInput.sysExtEvt.set_value('LeftWarningStatus', 'Reserved')
    elif status == u'警告':
        context.dorothyTestInput.sysExtEvt.set_value('LeftWarningStatus', 'Warning')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上车道偏离故障类型为{status}')
def step_impl(context, status):
    if status == u'无':
        context.dorothyTestInput.sysExtEvt.set_value('FaultStatus', 'No Fault')
    elif status == u'通信丢失':
        context.dorothyTestInput.sysExtEvt.set_value('FaultStatus', 'CAN Communication')
    elif status == u'临时故障':
        context.dorothyTestInput.sysExtEvt.set_value('FaultStatus', 'Temporary Failure')
    elif status == u'永久故障':
        context.dorothyTestInput.sysExtEvt.set_value('FaultStatus', 'Permanent Failure')
    elif status == u'保留故障码':
        context.dorothyTestInput.sysExtEvt.set_value('FaultStatus', 'Reserve')
    else:
        logging.error("error status:" + status)
        raise Exception


@when(u'CANBUS上车道偏离校准状态为{status}')
def step_impl(context, status):
    if status == u'未进行校正':
        context.dorothyTestInput.sysExtEvt.set_value('CalculationStatus', 'Calibration Not Executed')
    elif status == u'校正中':
        context.dorothyTestInput.sysExtEvt.set_value('CalculationStatus', 'Calibration In Process')
    elif status == u'校正成功':
        context.dorothyTestInput.sysExtEvt.set_value('CalculationStatus', 'Calibration Success')
    elif status == u'校正失败':
        context.dorothyTestInput.sysExtEvt.set_value('CalculationStatus', 'Calibration Failed')
    else:
        logging.error("error status:" + status)
        raise Exception


@then(u'HUD不显示车道偏离信息')
def step_impl(context):
    key = 'LDWInformation'
    value = 'Off'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示车道偏离系统激活')
def step_impl(context):
    key = 'LDWOperationStatus'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示左侧压线报警')
def step_impl(context):
    key = 'LDWLeftWarningStatus'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示右侧压线报警')
def step_impl(context):
    key = 'LDWRightWarningStatus'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示车道偏离摄像头遮挡')
def step_impl(context):
    key = 'LDWOperationStatus'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示车道偏离系统故障')
def step_impl(context):
    key = 'LDWOperationStatus'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]
