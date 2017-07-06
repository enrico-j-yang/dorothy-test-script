# -*- coding: utf-8 -*-
"""

"""

import logging
import threading
import time


class CallBackTimer(threading.Thread):
    def __init__(self, interval, duration, cb):
        super(CallBackTimer, self).__init__()
        self.interval = float(interval)
        self.duration = float(duration)
        self.cb = cb
        logging.debug("CallBackTimer")
        logging.debug("interval:" + str(self.interval))
        logging.debug("duration:" + str(self.duration))

    def run(self):
        old_time = time.time()
        logging.debug("start_time:" + str(old_time))
        if not self.interval == 0:
            times = int(self.duration / self.interval)
            logging.debug("times:" + str(times))
            for step in range(1, times + 1):
                new_time = time.time()
                logging.debug("new_time:" + str(new_time))
                com_time = new_time - old_time
                logging.debug("com_time:" + str(com_time))
                sleep_time = self.interval
                logging.debug("sleep_time:" + str(sleep_time))
                if sleep_time >= com_time > 0:
                    sleep_time = sleep_time - com_time
                time.sleep(sleep_time)
                old_time = time.time()
                logging.debug("old_time:" + str(old_time))
                self.cb(step * self.interval)
                logging.debug("Callback step:" + str(step))

    def stop(self):
        self.join()


class MyLoopTimer(threading.Thread):
    callback_function = None
    interval = 0

    def __init__(self, event, interval, callback_function, cb_args):
        super(MyLoopTimer, self).__init__(name=str(interval))
        self.stopped = event
        self.interval = interval
        self.cb_args = cb_args
        self.callback_function = callback_function
        logging.debug("MyLoopTimer")
        logging.debug("interval:" + str(self.interval))

    def run(self):
        while not self.stopped.wait(self.interval):
            self.callback_function(self.cb_args[0], self.cb_args[1])
