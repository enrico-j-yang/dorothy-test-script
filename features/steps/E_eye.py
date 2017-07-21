# -*- coding: utf-8 -*-
"""
E_eye.py is step implementation file for E_eye.feature

"""
import logging

from behave import *


@when(u'CANBUS上电子眼限速值为{cam_speed_limit}km/h')
def step_impl(context, cam_speed_limit):
    context.dorothyTestInput.sysExtEvt.set_value('CamSpeedLimit', cam_speed_limit)


@when(u'CANBUS上电子眼类型为{cam_type}')
def step_impl(context, cam_type):
    if cam_type == u'红绿灯':
        context.dorothyTestInput.sysExtEvt.set_value('CamType', 'Traffic Light')
    elif cam_type == u'违章拍照':
        context.dorothyTestInput.sysExtEvt.set_value('CamType', 'BreakRule')
    elif cam_type == u'无人看守铁路道口':
        context.dorothyTestInput.sysExtEvt.set_value('CamType', 'WarningRailway')
    elif cam_type == u'事故易发路段':
        context.dorothyTestInput.sysExtEvt.set_value('CamType', 'WarningAccidentWay')
    elif cam_type == u'下陡坡':
        context.dorothyTestInput.sysExtEvt.set_value('CamType', 'WarningRapidDownWay')
    elif cam_type == u'学校路段':
        context.dorothyTestInput.sysExtEvt.set_value('CamType', 'WarningSchool')
    elif cam_type == u'连续弯路':
        context.dorothyTestInput.sysExtEvt.set_value('CamType', 'WarningRapidTurn')
    elif cam_type == u'傍山险路':
        context.dorothyTestInput.sysExtEvt.set_value('CamType', 'WarningHillWay')
    elif cam_type == u'注意危险':
        context.dorothyTestInput.sysExtEvt.set_value('CamType', 'WarningOther')
    elif cam_type == u'保留值':
        context.dorothyTestInput.sysExtEvt.set_value('CamType', 'Reserve')
    else:
        logging.error("error status:" + cam_type)
        raise Exception


@when(u'CANBUS上电子眼距离为500米')
def step_impl(context):
    raise NotImplementedError(u'STEP: When CANBUS上电子眼距离为500米')


@when(u'CANBUS上引导方向类型为非法值')
def step_impl(context):
    raise NotImplementedError(u'STEP: When CANBUS上引导方向类型为非法值')


@then(u'HUD显示电子眼限速图标，限速60km/h')
def step_impl(context):
    raise NotImplementedError(u'STEP: Then HUD显示电子眼限速图标，限速60km/h')
