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


@when(u'CANBUS上电子眼距离为{dest_dist}米')
def step_impl(context, dest_dist):
    context.dorothyTestInput.sysExtEvt.set_value('DestDist', dest_dist)


@when(u'CANBUS上引导方向类型为{turn_type}')
def step_impl(context, turn_type):
    if turn_type == u'非法值':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'Invalid')
    elif turn_type == u'保留值':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'Reserve')
    elif turn_type == u'1':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'Straight')
    elif turn_type == u'2':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'TurnLeft')
    elif turn_type == u'3':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'TurnRight')
    elif turn_type == u'4':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'TurnRound')
    elif turn_type == u'5':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '10LeftFrontDrive')
    elif turn_type == u'6':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'LeftRearDrive')
    elif turn_type == u'7':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '13LeftFrontDrive')
    elif turn_type == u'8':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '15RightFrontDrive')
    elif turn_type == u'9':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '16RightFrontDrive')
    elif turn_type == u'10':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'RightRearDrive')
    elif turn_type == u'11':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'MotorwayEntry')
    elif turn_type == u'12':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'LeftFrontEntryMotorway')
    elif turn_type == u'13':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'RightFrontEntryMotorway')
    elif turn_type == u'14':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'ExitMotorway')
    elif turn_type == u'15':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'LeftMotorwayExit')
    elif turn_type == u'16':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'RightMotorwayExit')
    elif turn_type == u'17':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'StraightOntoBridge')
    elif turn_type == u'18':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'TurnLeftOntoBridge')
    elif turn_type == u'19':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'TurnRightOntoBridge')
    elif turn_type == u'20':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'EnterTunnel')
    elif turn_type == u'21':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'FrontTollStation')
    elif turn_type == u'22':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'EnterFerry')
    elif turn_type == u'23':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'ExitFerry')
    elif turn_type == u'24':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'EnterRoundabout')
    elif turn_type == u'25':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'RoundaboutStraight')
    elif turn_type == u'26':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '45RoundaboutRightFrontDrive')
    elif turn_type == u'27':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '46RoundaboutRightFrontDrive')
    elif turn_type == u'28':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'RoundaboutTurnRight')
    elif turn_type == u'29':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '48RoundaboutRightRearDrive')
    elif turn_type == u'30':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '49RoundaboutRightRearDrive')
    elif turn_type == u'31':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'RoundaboutTurnRound')
    elif turn_type == u'32':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '51RoundaboutLeftRearDrive')
    elif turn_type == u'33':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '52RoundaboutLeftRearDrive')
    elif turn_type == u'34':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'RoundaboutTurnLeft')
    elif turn_type == u'35':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '54RoundaboutLeftFrontDrive')
    elif turn_type == u'36':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '55RoundaboutLeftFrontDrive')
    elif turn_type == u'37':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'LeftStraightOntoBridge')
    elif turn_type == u'38':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '74LeftOntoBridge')
    elif turn_type == u'39':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '75RightOntoBridge')
    elif turn_type == u'40':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '76LeftDownBridge')
    elif turn_type == u'41':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', '77RightDownBridge')
    elif turn_type == u'42':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'StraightEnterUndergroundDriveway')
    elif turn_type == u'43':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'LeftEnterUndergroundDriveway')
    elif turn_type == u'44':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'RightEnterUndergroundDriveway')
    elif turn_type == u'45':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'LeftDrive')
    elif turn_type == u'46':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'RightDrive')
    elif turn_type == u'47':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'ServiceArea')
    elif turn_type == u'48':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'ViaDestination')
    elif turn_type == u'49':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'ViaDestination1')
    elif turn_type == u'50':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'ViaDestination2')
    elif turn_type == u'51':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'ViaDestination3')
    elif turn_type == u'52':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'Destination')
    elif turn_type == u'53':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'LeftDestination')
    elif turn_type == u'54':
        context.dorothyTestInput.sysExtEvt.set_value('TurnType', 'RightDestination')
    else:
        logging.error("error status:" + turn_type)
        raise Exception


@then(u'HUD显示电子眼限速图标，限速{cam_speed_limit}km/h')
def step_impl(context, cam_speed_limit):
    key = 'CamSpeedLimit'
    value = cam_speed_limit
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示电子眼限速图标以1Hz频率闪烁')
def step_impl(context):
    key = 'CamSpeedLimit'
    value = 'On'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示电子眼限速图标不闪烁')
def step_impl(context):
    key = 'CamSpeedLimit'
    value = 'Off'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD不显示电子眼限速图标')
def step_impl(context):
    key = 'CamSpeedLimit'
    value = 'Off'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示电子眼{cam_type}图标')
def step_impl(context, cam_type):
    key = '红绿灯'
    value = cam_type
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD不显示电子眼信息')
def step_impl(context):
    key = 'CamType'
    value = 'Off'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示电子眼距离为{dest_dist}米')
def step_impl(context, dest_dist):
    key = 'DestDist'
    value = dest_dist
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD显示引导方向类型图为{turn_type}')
def step_impl(context, turn_type):
    key = 'TurnType'
    value = turn_type
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]


@then(u'HUD不显示引导方向类型图')
def step_impl(context):
    key = 'TurnType'
    value = 'Off'
    context.dorothyExpRes.set_value(key, value)
    context.dorothyActRes.mock_value(key, value)
    context.dorothyActRes.get_value(key)
    logging.debug("context.dorothyExpRes." + key + ": " + str(context.dorothyExpRes.dist[key]))
    logging.debug("context.dorothyActRes." + key + ": " + str(context.dorothyActRes.dist[key]))
    assert context.dorothyActRes.dist[key] == context.dorothyExpRes.dist[key]
