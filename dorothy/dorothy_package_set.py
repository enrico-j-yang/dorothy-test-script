# -- coding: utf-8 --

from can_sim.engine_p import *
from can_sim.fuel_p import *
from can_sim.hud_set_p import *
from can_sim.ldw_p import *
from can_sim.navigation_p import *
from can_sim.package_set import *
from can_sim.speed_p import *
from can_sim.tire_p import *
from common.test_timer import *


class DorothyPackageSet(PackageSet):
    cb = None
    stop_flag = None
    duration = 0
    start_time = 0
    interrupt = False

    digital_values = {}
    list_values = {}
    navigation_1_values = {}
    navigation_2_values = {}
    navigation_3_values = {}
    navigation_road_values = {}

    var_navigation_clear = "navigation_clear"
    var_navigation_navi1 = "navigation_1"
    var_navigation_navi2 = "navigation_2"
    var_navigation_current_road = "navigation_current_road"
    var_navigation_navi3 = "navigation_3"

    navigation_thread = None
    navigation_cycle_time = 0.1
    navigation_flag = False
    navigation_road_name = []

    navigation_package_list = {
        var_navigation_clear: [0x333, PackageSet.default_data, navigation_cycle_time],
        var_navigation_navi1: [0x333, PackageSet.default_data, navigation_cycle_time],
        var_navigation_navi2: [0x333, PackageSet.default_data, navigation_cycle_time],
        var_navigation_current_road: [0x333, PackageSet.default_data, navigation_cycle_time],
        var_navigation_navi3: [0x333, PackageSet.default_data, navigation_cycle_time]
    }

    """docstring for PackageSet"""

    def __init__(self, can_serial):
        super(PackageSet, self).__init__()
        super(PackageSet, self).__init__()
        self.can_serial = can_serial
        self.sem = threading.Semaphore(1)
        self.lock = threading.Lock()
        self.speed_p = SpeedP()
        self.engine_p = CoolantTemperatureP()
        self.tire_p = TireP()
        self.hud_set_p = HudSetP()
        self.fuel_p = FuelP()
        self.ldw_p = LdwP()
        self.navigation_p = NavigationP()
        self.limit_p = LimitSpeedP()
        self.indicator_p = IndicatorP()

    def set_up(self):
        self.duration = 0
        self.start_time = 0
        self.navigation_flag = False
        self.interrupt = False
        self.digital_values = {
            "Speed": {"Package": self.var_speed,
                      "Initial Value": 0,
                      "End Value": 0,
                      "Process": self.speed_p,
                      "Process Set Value Method": self.speed_p.set_speed},
            "ECT": {"Package": self.var_coolant_temp,
                    "Initial Value": 0,
                    "End Value": 0,
                    "Process": self.engine_p,
                    "Process Set Value Method": self.engine_p.set_temperature},
            "RPM": {"Package": self.var_limit_speed,
                    "Initial Value": 0,
                    "End Value": 0,
                    "Process": self.limit_p,
                    "Process Set Value Method": self.limit_p.set_rpm},
            "LimitCruiseSpeed": {"Package": self.var_limit_speed,
                                 "Initial Value": 0,
                                 "End Value": 0,
                                 "Process": self.limit_p,
                                 "Process Set Value Method": self.limit_p.set_limit_speed},
            "SurplusFuel": {"Package": self.var_fuel,
                            "Initial Value": 0,
                            "End Value": 0,
                            "Process": self.fuel_p,
                            "Process Set Value Method": self.fuel_p.set_fuel},
            "TirePressure": {"Package": self.var_tire,
                             "Initial Value": 0,
                             "End Value": 0,
                             "Process": self.tire_p,
                             "Process Set Value Method": self.tire_p.set_tire_pressure},
            "TireTemperature": {"Package": self.var_tire,
                                "Initial Value": 0,
                                "End Value": 0,
                                "Process": self.tire_p,
                                "Process Set Value Method": self.tire_p.set_tire_temperature}
        }
        self.list_values = {
            "RPMValid": {"Package": self.var_limit_speed,
                         "Process": self.limit_p,
                         "Process Set Value Method": self.limit_p.set_rpm_valid},
            'LimitControlStatus': {"Package": self.var_limit_speed,
                                   "Process": self.limit_p,
                                   "Process Set Value Method": self.limit_p.set_limit_status},
            'CruiseControlStatus': {"Package": self.var_limit_speed,
                                    "Process": self.limit_p,
                                    "Process Set Value Method": self.limit_p.set_cruise_status},
            'EngineRunningStatus': {"Package": self.var_limit_speed,
                                    "Process": self.limit_p,
                                    "Process Set Value Method": self.limit_p.set_engine_status},
            "LimitIndicator": {"Package": self.var_indicator,
                               "Process": self.indicator_p,
                               "Process Set Value Method": self.indicator_p.set_cruise_indicate},
            "LimitUnavailDisplay": {"Package": self.var_indicator,
                                    "Process": self.indicator_p,
                                    "Process Set Value Method": self.indicator_p.set_cruise_unavail_display},
            "CruiseIndicator": {"Package": self.var_indicator,
                                "Process": self.indicator_p,
                                "Process Set Value Method": self.indicator_p.set_limit_indicate},
            "CruiseUnavailDisplay": {"Package": self.var_indicator,
                                     "Process": self.indicator_p,
                                     "Process Set Value Method": self.indicator_p.set_limit_unavail_display},
            "ECTValid": {"Package": self.var_coolant_temp,
                         "Process": self.engine_p,
                         "Process Set Value Method": self.engine_p.set_status},
            'DriverSeatBeltLamp': {"Package": self.var_fuel,
                                   "Process": self.fuel_p,
                                   "Process Set Value Method": self.fuel_p.set_driver_seat_belt_warning},
            'PassengerSeatBeltLamp': {"Package": self.var_fuel,
                                      "Process": self.fuel_p,
                                      "Process Set Value Method": self.fuel_p.set_passenger_seat_belt_warning},
            'SystemStatus': {"Package": self.var_tire,
                             "Process": self.tire_p,
                             "Process Set Value Method": self.tire_p.set_system_status},
            'TireID': {"Package": self.var_tire,
                       "Process": self.tire_p,
                       "Process Set Value Method": self.tire_p.set_tire_id},
            'TireInformation': {"Package": self.var_tire,
                                "Process": self.tire_p,
                                "Process Set Value Method": self.tire_p.set_tire_validity},
            'TireLeakage': {"Package": self.var_tire,
                            "Process": self.tire_p,
                            "Process Set Value Method": self.tire_p.set_tire_leak},
            'LearningStatus': {"Package": self.var_tire,
                               "Process": self.tire_p,
                               "Process Set Value Method": self.tire_p.set_tire_learning_status},
            'TirePressureStatus': {"Package": self.var_tire,
                                   "Process": self.tire_p,
                                   "Process Set Value Method": self.tire_p.set_tire_pressure_status},
            'TireTemperatureStatus': {"Package": self.var_tire,
                                      "Process": self.tire_p,
                                      "Process Set Value Method": self.tire_p.set_tire_temperature_status},
            'TireBatteryPower': {"Package": self.var_tire,
                                 "Process": self.tire_p,
                                 "Process Set Value Method": self.tire_p.set_tire_battery_power},
            'TireBatteryPowerSts': {"Package": self.var_tire,
                                    "Process": self.tire_p,
                                    "Process Set Value Method": self.tire_p.set_tire_battery_power_status},
            'OperationStatus': {"Package": self.var_ldw,
                                "Process": self.ldw_p,
                                "Process Set Value Method": self.ldw_p.set_operation_status},
            'RightWarningStatus': {"Package": self.var_ldw,
                                   "Process": self.ldw_p,
                                   "Process Set Value Method": self.ldw_p.set_right_warning_status},
            'LeftWarningStatus': {"Package": self.var_ldw,
                                  "Process": self.ldw_p,
                                  "Process Set Value Method": self.ldw_p.set_left_warning_status},
            'FaultStatus': {"Package": self.var_ldw,
                            "Process": self.ldw_p,
                            "Process Set Value Method": self.ldw_p.set_fault_status},
            'CalculationStatus': {"Package": self.var_ldw,
                                  "Process": self.ldw_p,
                                  "Process Set Value Method": self.ldw_p.set_calculation_status},
        }

        self.navigation_1_values = {
            "DestDistance": {"Package": self.var_navigation_navi1,
                             "Initial Value": 0,
                             "End Value": 0,
                             "Process": self.navigation_p,
                             "Process Set Value Method": self.navigation_p.set_nav_distance_and_time},
            "DestHour": {"Package": self.var_navigation_navi1,
                         "Initial Value": 0,
                         "End Value": 0,
                         "Process": self.navigation_p,
                         "Process Set Value Method": self.navigation_p.set_nav_distance_and_time},
            "DestMinute": {"Package": self.var_navigation_navi1,
                           "Initial Value": 0,
                           "End Value": 0,
                           "Process": self.navigation_p,
                           "Process Set Value Method": self.navigation_p.set_nav_distance_and_time},
            "NextCrossDistance": {"Package": self.var_navigation_navi1,
                                  "Initial Value": 0,
                                  "End Value": 0,
                                  "Process": self.navigation_p,
                                  "Process Set Value Method": self.navigation_p.set_nav_distance_and_time},
        }

        self.navigation_2_values = {
            "NextCrossProgress": {"Package": self.var_navigation_navi2,
                             "Initial Value": 0,
                             "End Value": 0,
                             "Process": self.navigation_p,
                             "Process Set Value Method": self.navigation_p.set_nav_crossroad_and_angle},
            "NextCrossType": {"Package": self.var_navigation_navi2,
                                  "Initial Value": 0,
                                  "End Value": 0,
                                  "Process": self.navigation_p,
                                  "Process Set Value Method": self.navigation_p.set_nav_crossroad_and_angle},
            "Angle": {"Package": self.var_navigation_navi2,
                                  "Initial Value": 0,
                                  "End Value": 0,
                                  "Process": self.navigation_p,
                                  "Process Set Value Method": self.navigation_p.set_nav_crossroad_and_angle},
        }

        self.navigation_3_values = {
        }

        self.navigation_road_values = {
            "RoadNameHide": {"Package": self.var_navigation_current_road,
                             "Process": self.navigation_p,
                             "Process Set Value Method": self.navigation_p.clear_nav_road},
            "RoadName1": {"Package": self.var_navigation_current_road,
                          "Process": self.navigation_p,
                          "Process Set Value Method": self.navigation_p.set_nav_road},
            "RoadName2": {"Package": self.var_navigation_current_road,
                          "Process": self.navigation_p,
                          "Process Set Value Method": self.navigation_p.set_nav_road},
            "RoadName3": {"Package": self.var_navigation_current_road,
                          "Process": self.navigation_p,
                          "Process Set Value Method": self.navigation_p.set_nav_road},
            "RoadName4": {"Package": self.var_navigation_current_road,
                          "Process": self.navigation_p,
                          "Process Set Value Method": self.navigation_p.set_nav_road},
            "RoadName5": {"Package": self.var_navigation_current_road,
                          "Process": self.navigation_p,
                          "Process Set Value Method": self.navigation_p.set_nav_road},
            "RoadName6": {"Package": self.var_navigation_current_road,
                          "Process": self.navigation_p,
                          "Process Set Value Method": self.navigation_p.set_nav_road},
            "RoadName7": {"Package": self.var_navigation_current_road,
                          "Process": self.navigation_p,
                          "Process Set Value Method": self.navigation_p.set_nav_road},
            "RoadName8": {"Package": self.var_navigation_current_road,
                          "Process": self.navigation_p,
                          "Process Set Value Method": self.navigation_p.set_nav_road},
            "RoadName9": {"Package": self.var_navigation_current_road,
                          "Process": self.navigation_p,
                          "Process Set Value Method": self.navigation_p.set_nav_road},
            "RoadName10": {"Package": self.var_navigation_current_road,
                           "Process": self.navigation_p,
                           "Process Set Value Method": self.navigation_p.set_nav_road},

        }

    def set_duration(self, duration):
        self.duration = float(duration)

    def start_send(self):
        self.interrupt = False
        time_li = []
        # 对周期进行分组,后续每一个周期分配一条线程
        for i in range(0, len(self.cycle_time)):
            tmp_time = self.cycle_time[i]
            id_li = []
            # 同样周期的数据根据id进行排序
            for key in self.package_list.keys():
                val = self.package_list.get(key)
                if val[2] == tmp_time:
                    target_i = 0
                    for id_i in range(0, len(id_li)):
                        # 比较两个id的大小
                        if val[0] > self.package_list.get(id_li[id_i])[0]:
                            target_i += 1
                    id_li.insert(target_i, key)

            time_li.append(id_li)

        self.stop_flag = threading.Event()
        # 把处理完的list放入线程
        for i in range(0, len(time_li)):
            # 开启一条线程
            t = MyLoopTimer(self.stop_flag, self.cycle_time[i], self.send_callback, (self.cycle_time[i], time_li[i]))
            self.threads.append(t)

        if self.navigation_flag:
            self.navigation_thread = MyLoopTimer(self.stop_flag, self.navigation_cycle_time,
                                                 self.send_navigation_callback,
                                                 (self.navigation_cycle_time,))
            self.threads.append(self.navigation_thread)

        for t in self.threads:
            t.start()

        self.start_time = time.time()
        logging.debug("start_time:" + str(self.start_time))
        event = threading.Event()
        event.wait(self.duration)
        self.stop_send()
        return True

    def stop_send(self):
        self.interrupt = True
        # clear navigation road name list
        self.navigation_road_name = []
        # this will stop the timer
        self.stop_flag.set()
        for t in self.threads:
            t.join()
            del t
        self.threads.clear()
        return True

    def send_callback(self, inc, time_li):
        if self.interrupt is True:
            return

        try:
            eclipse_time = time.time() - self.start_time

            logging.debug("eclipse_time:" + str(eclipse_time))

            for val in time_li:
                for key, value in self.digital_values.items():
                    if value["Package"] == val:
                        init_value = value["Initial Value"]
                        end_value = value["End Value"]
                        logging.debug("init " + key + ":" + str(init_value))
                        logging.debug("end " + key + ":" + str(end_value))
                        logging.debug("duration:" + str(self.duration))

                        if init_value != end_value:
                            current_value = round(init_value + (end_value -
                                                                init_value) * eclipse_time / self.duration, 1)
                        else:
                            current_value = init_value

                        logging.debug("current " + key + ":" + str(current_value))
                        value["Process Set Value Method"](float(current_value))
                        self.set(value["Package"],
                                 value["Process"].get_data())

                msg_id = self.package_list.get(val)[0]
                msg_data = self.package_list.get(val)[1]
                logging.debug("inc" + str(inc) + "-" + val + "-msg_id" + str(msg_id) + "-msg_data" + str(msg_data))
                with self.lock:
                    send_status = self.can_serial.send_data(msg_id, msg_data)
                logging.debug("after send data inc" + str(inc) + ":" + str(time.time()))

                if send_status == 1:
                    logging.debug("发送成功")
                elif send_status == -1:
                    logging.debug("请生成数据")
                else:
                    logging.error("发送失败")
        except Exception as e:
            logging.error(e)
            self.stop_flag.set()

    def send_navigation_callback(self, inc):
        if self.interrupt is True:
            return

        try:
            eclipse_time = time.time() - self.start_time

            logging.debug("eclipse_time:" + str(eclipse_time))
            for package_key, package_value in self.navigation_package_list.items():
                parameters = ()
                if package_key == self.var_navigation_clear:
                    msg_id = package_value[0]
                    msg_data = package_value[1]
                    logging.debug(
                        "inc" + str(inc) + "-" + package_key + "-msg_id" + str(msg_id) + "-msg_data" + str(msg_data))
                    with self.lock:
                        send_status = self.can_serial.send_data(msg_id, msg_data)
                    logging.debug("after send data inc" + str(inc) + ":" + str(time.time()))

                    if send_status == 1:
                        logging.debug("发送成功")
                    elif send_status == -1:
                        logging.debug("请生成数据")
                    else:
                        logging.error("发送失败")
                elif package_key == self.var_navigation_current_road:
                    # 路名3个分一组数据包
                    frame_count = 1
                    for frame_index, part_name in self.navigation_road_name:
                        value = self.navigation_road_values[frame_index]
                        frame_index = frame_index[len("RoadName"):len(frame_index)]
                        # 是否为单桢
                        if frame_index == 'Hide':
                            value["Process Set Value Method"]()
                        else:
                            # 是否为结束包

                            if int(part_name[0:part_name.index(":")]) == 3:
                                end_flag = True
                                part_name = part_name[part_name.index(":") + 1:len(part_name)]
                            elif 0 < int(part_name[0:part_name.index(":")]) < 3:
                                end_flag = False
                                part_name = part_name[part_name.index(":") + 1:len(part_name)]
                            elif int(part_name[0:part_name.index(":")]) == 0:
                                end_flag = True
                                part_name = ""
                            else:
                                logging.error("error frame type")
                                raise Exception

                            value["Process Set Value Method"](int(frame_index), end_flag, part_name)
                            frame_count += 1
                            self.set_navigation(value["Package"],
                                                value["Process"].get_data())

                        msg_id = package_value[0]
                        msg_data = package_value[1]
                        logging.debug(
                            "inc" + str(inc) + "-" + package_key + "-msg_id" + str(msg_id) + "-msg_data" + str(
                                msg_data))
                        with self.lock:
                            send_status = self.can_serial.send_data(msg_id, msg_data)
                        logging.debug("after send data inc" + str(inc) + ":" + str(time.time()))

                        if send_status == 1:
                            logging.debug("发送成功")
                        elif send_status == -1:
                            logging.debug("请生成数据")
                        else:
                            logging.error("发送失败")
                elif package_key == self.var_navigation_navi1:
                    for key, value in self.navigation_1_values.items():
                        if value['Package'] == package_key:
                            init_value = value["Initial Value"]
                            end_value = value["End Value"]
                            logging.debug("init " + key + ":" + str(init_value))
                            logging.debug("end " + key + ":" + str(end_value))
                            logging.debug("duration:" + str(self.duration))

                            if init_value != end_value:
                                current_value = round(init_value + (end_value -
                                                                    init_value) * eclipse_time / self.duration, 1)
                            else:
                                current_value = init_value

                            logging.debug("current " + package_key + ":" + str(current_value))
                            parameters += (current_value,)

                    if len(parameters) > 0:
                        value["Process Set Value Method"](*parameters)
                        self.set_navigation(value["Package"],
                                            value["Process"].get_data())

                        msg_id = package_value[0]
                        msg_data = package_value[1]
                        logging.debug(
                            "inc" + str(inc) + "-" + package_key + "-msg_id" + str(msg_id) + "-msg_data" + str(
                                msg_data))
                        with self.lock:
                            send_status = self.can_serial.send_data(msg_id, msg_data)
                        logging.debug("after send data inc" + str(inc) + ":" + str(time.time()))

                        if send_status == 1:
                            logging.debug("发送成功")
                        elif send_status == -1:
                            logging.debug("请生成数据")
                        else:
                            logging.error("发送失败")
                elif package_key == self.var_navigation_navi2:
                    for key, value in self.navigation_1_values.items():
                        if value['Package'] == package_key:
                            init_value = value["Initial Value"]
                            end_value = value["End Value"]
                            logging.debug("init " + key + ":" + str(init_value))
                            logging.debug("end " + key + ":" + str(end_value))
                            logging.debug("duration:" + str(self.duration))

                            if init_value != end_value:
                                current_value = round(init_value + (end_value -
                                                                    init_value) * eclipse_time / self.duration, 1)
                            else:
                                current_value = init_value

                            logging.debug("current " + package_key + ":" + str(current_value))
                            parameters += (current_value,)

                    if len(parameters) > 0:
                        value["Process Set Value Method"](*parameters)
                        self.set_navigation(value["Package"],
                                            value["Process"].get_data())

                        msg_id = package_value[0]
                        msg_data = package_value[1]
                        logging.debug(
                            "inc" + str(inc) + "-" + package_key + "-msg_id" + str(msg_id) + "-msg_data" + str(
                                msg_data))
                        with self.lock:
                            send_status = self.can_serial.send_data(msg_id, msg_data)
                        logging.debug("after send data inc" + str(inc) + ":" + str(time.time()))

                        if send_status == 1:
                            logging.debug("发送成功")
                        elif send_status == -1:
                            logging.debug("请生成数据")
                        else:
                            logging.error("发送失败")
                elif package_key == self.var_navigation_navi3:
                    for key, value in self.navigation_1_values.items():
                        if value['Package'] == package_key:
                            init_value = value["Initial Value"]
                            end_value = value["End Value"]
                            logging.debug("init " + key + ":" + str(init_value))
                            logging.debug("end " + key + ":" + str(end_value))
                            logging.debug("duration:" + str(self.duration))

                            if init_value != end_value:
                                current_value = round(init_value + (end_value -
                                                                    init_value) * eclipse_time / self.duration, 1)
                            else:
                                current_value = init_value

                            logging.debug("current " + package_key + ":" + str(current_value))
                            parameters += (current_value,)

                    if len(parameters) > 0:
                        value["Process Set Value Method"](*parameters)
                        self.set_navigation(value["Package"],
                                            value["Process"].get_data())

                        msg_id = package_value[0]
                        msg_data = package_value[1]
                        logging.debug(
                            "inc" + str(inc) + "-" + package_key + "-msg_id" + str(msg_id) + "-msg_data" + str(
                                msg_data))
                        with self.lock:
                            send_status = self.can_serial.send_data(msg_id, msg_data)
                        logging.debug("after send data inc" + str(inc) + ":" + str(time.time()))

                        if send_status == 1:
                            logging.debug("发送成功")
                        elif send_status == -1:
                            logging.debug("请生成数据")
                        else:
                            logging.error("发送失败")
                else:
                    logging.error("unknown navigation package key")
                    self.stop_flag.set()
                    return False
        except IndexError as e:
            logging.error(e)
            self.stop_flag.set()
            return False
        except Exception as e:
            logging.error(e)
            self.stop_flag.set()
            return False
        else:
            return True

    def set_initial_value(self, key, value):
        """
        set initial value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_initial_value:" + str(value))
        self.digital_values.get(key)["Initial Value"] = float(value)

    def set_end_value(self, key, value):
        """
        set end value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_end_value:" + str(value))
        self.digital_values.get(key)["End Value"] = float(value)

    def set_initial_navigation_value(self, key, value):
        """
        set initial value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_initial_value:" + str(value))
        for item_key, item_value in self.navigation_1_values.items():
            if key == item_key:
                logging.debug(item_key + ":" + str(value))
                self.navigation_1_values.get(key)["Initial Value"] = float(value)

        for item_key, item_value in self.navigation_2_values.items():
            if key == item_key:
                logging.debug(item_key + ":" + str(value))
                self.navigation_2_values.get(key)["Initial Value"] = float(value)

        for item_key, item_value in self.navigation_3_values.items():
            if key == item_key:
                logging.debug(item_key + ":" + str(value))
                self.navigation_3_values.get(key)["Initial Value"] = float(value)

    def set_end_navigation_value(self, key, value):
        """
        set end value for key
        :param key: key
        :param value: value
        :return: None
        """
        logging.debug("set_end_value:" + str(value))
        for item_key, item_value in self.navigation_1_values.items():
            if key == item_key:
                logging.debug(item_key + ":" + str(value))
                self.navigation_1_values.get(key)["End Value"] = float(value)

        for item_key, item_value in self.navigation_2_values.items():
            if key == item_key:
                logging.debug(item_key + ":" + str(value))
                self.navigation_2_values.get(key)["End Value"] = float(value)

        for item_key, item_value in self.navigation_3_values.items():
            if key == item_key:
                logging.debug(item_key + ":" + str(value))
                self.navigation_3_values.get(key)["End Value"] = float(value)

    def set_navigation(self, key, value):
        data_tuple = self.navigation_package_list.get(key)
        data_tuple[1] = value[1]

    def enable_navigation(self):
        self.navigation_flag = True

    def set_navigation_road_name(self, frame_number, navigation_road_name):
        if frame_number != 'RoadNameHide':
            self.navigation_road_name.append((frame_number, navigation_road_name))
        else:
            self.clear_navigation_road_name(frame_number, navigation_road_name)

    def clear_navigation_road_name(self, frame_number, navigation_road_name):
        self.navigation_road_name = [(frame_number, navigation_road_name)]
