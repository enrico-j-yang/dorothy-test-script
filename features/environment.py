
# -*- coding: utf-8 -*-


import os
import sys
from time import sleep

from behave import *
from behave.log_capture import capture


sys.path.append("../..")
#from common.common_test_step import CommonTestStep
#from common.mywebdriver import WebDriver

# Returns abs path relative to this file and not cwd
PATH = lambda p: os.path.abspath(
    os.path.join(os.path.dirname(__file__), p)
)

try:
    PATH.find("assistant/android/")
except:
    RESOURCE_PATH = "../resource/"
else:
    RESOURCE_PATH = "assistant/resource/"
    
def before_all(context):
    context = context
    
def after_all(context):
    context = context
    
def before_feature(context, feature):
    context = context

    
def after_feature(context, feature):
    context = context
    
def before_scenario(context, scenario):
    context = context
    
def after_scenario(context, scenario):
    context = context
    