# -*- coding: utf-8 -*-
'''

'''

import logging
import threading
import time


class CallBackTimer(threading.Thread):
    def __init__(self, interval, duration, cb):
        super(CallBackTimer, self).__init__()
        self.interval = int(interval)
        self.duration = int(duration)
        self.cb = cb
        logging.debug("CallBackTimer")
        logging.debug("interval:" + str(self.interval))
        logging.debug("duration:" + str(self.duration))

    def run(self):
        old_time = time.time()
        #logging.debug("start_time:" + str(old_time))
        if not self.interval == 0:
            times = int(self.duration / self.interval)
            #logging.debug("times:" + str(times))
            for step in range(1, times + 1):
                new_time = time.time()
                #logging.debug("new_time:" + str(new_time))
                com_time = new_time - old_time
                #logging.debug("com_time:" + str(com_time))
                sleep_time = self.interval / 1000
                #logging.debug("sleep_time:" + str(sleep_time))
                time.sleep(sleep_time - com_time)
                old_time = time.time()
                #logging.debug("old_time:" + str(old_time))
                self.cb(step * self.interval)
                #logging.debug("Callback step:" + str(step))

    def stop(self):
        self.join()
