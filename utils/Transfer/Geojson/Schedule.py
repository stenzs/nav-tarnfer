import itertools
from types import SimpleNamespace
from inserting_functions import insert_PropertiesWithSchedule, insert_Availability, insert_Timesheet_hol
from insert_db_dict import day_of_week


flatten = itertools.chain.from_iterable

class Day:
    def __init__(self):
        self.time_start = []
        self.time_end = []
        self.date_start = []
        self.date_end = []


class Schedule():
    def __init__(self, data, valid_time_begin, arp=True):
        self.data = data
        self.validTimeBegin = valid_time_begin
        self.arp = arp

    def insert_rw(self, table=None, uuid_airspace=None, status=None, name=None, rw_prop="no rw"):
        """
        внесение данных о радио rw - DRY вынесено отдельно тк используется в нескольких местах
        """

        id_properties_with_schedule = insert_PropertiesWithSchedule()
        insert_Availability("AirspaceActivation", name, id_properties_with_schedule, "ACTIVE", uuid_airspace)

        if name == "SECTOR":
            insert_Availability(table, name, id_properties_with_schedule, status, uuid_airspace)

        if not rw_prop:
            insert_Timesheet_hol(SimpleNamespace(**{"idPropertiesWithSchedule": id_properties_with_schedule}))
            return

        if self.is_notam(rw_prop):
            cursor.execute(f"UPDATE AirspaceActivation set status = 'AVBL_FOR_ACTIVATION' where id = {id_properties_with_schedule}")
            return

        week, weekday, result, hol = self.set_schedule(rw_prop)
        startDate = "NULL" if any(res is None for res in result[2][0]) else f"unnest(ARRAY{list(flatten(result[2]))})"
        endDate = "NULL" if any(res is None for res in result[3][0]) else f"unnest(ARRAY{list(flatten(result[3]))})"
        cursor.execute(f"""
            INSERT INTO Timesheet (day, startDate, endDate, startTime, endTime, idPropertiesWithSchedule)
            VALUES (unnest(ARRAY{list(flatten(weekday))}), {startDate}, {endDate}, 
                unnest(ARRAY{list(flatten(result[0]))}), unnest(ARRAY{list(flatten(result[1]))}), {id_properties_with_schedule})""")

        if not hol:
            insert_Timesheet_hol(SimpleNamespace(**{"idPropertiesWithSchedule": id_properties_with_schedule}))

    @staticmethod
    def is_notam(rw_prop):
        rw_prop = eval(rw_prop) if type(rw_prop) == str else rw_prop
        if any("notam" in sl for sl in rw_prop):
            index = [i for i, x in enumerate(rw_prop) if "notam" in x]
            return rw_prop[index[0]]["notam"]

    def set_schedule(self, rw_prop):
        week = {}
        hol = True if any('holidays' in sl for sl in rw_prop) else False
        rw_prop = eval(rw_prop) if type(rw_prop) == str else rw_prop
        for rw in rw_prop:
            hol, week = self.rw_parse(rw, hol, week, rw_prop)
        if all(k in week for k in ('MON', 'TUE', 'WED', 'THU', 'FRI')):
            if week['MON']['time_start'] == week['TUE']['time_start'] == week['WED']['time_start'] == \
                    week['THU']['time_start'] == week['FRI']['time_start'] and \
                    week['MON']['time_end'] == week['TUE']['time_end'] == week['WED']['time_end'] == \
                    week['THU']['time_end'] == week['FRI']['time_end'] and \
                    week['MON']['date_start'] == week['TUE']['date_start'] == week['WED']['date_start'] == \
                    week['THU']['date_start'] == week['FRI']['date_start'] and \
                    week['MON']['date_end'] == week['TUE']['date_end'] == week['WED']['date_end'] == \
                    week['THU']['date_end'] == week['FRI']['date_end']:
                week['WORK_DAY'] = week['MON']
                del week['MON'], week['TUE'], week['WED'], week['THU'], week['FRI']
        weekday = [[k] * len(week[k]['time_start']) for k, v in week.items()]
        nested = [[v for k, v in d.items()] for d in list(week.values())]
        return week, weekday, list(map(list, zip(*nested))), hol

    @staticmethod
    def rw_parse(rw, hol, week, rw_prop):
        hol = False if hol and rw.get('holidays') is False else hol
        if 'day_of_the_week' in rw:
            for dday in rw['day_of_the_week']:
                time_of_the_day_end = '24:00' if rw['time_of_the_day_end'] == '23:59' else rw[
                    'time_of_the_day_end']
                day = day_of_week.get(dday)
                currentDay = Day()
                currentDay.time_start.append(rw['time_of_the_day_start'])
                currentDay.time_end.append(time_of_the_day_end)
                currentDay.date_start.append(rw['date_start'].replace('.', '-'))
                currentDay.date_end.append(rw['date_end'].replace('.', '-'))
                if day not in week:
                    week[day] = currentDay.__dict__
                else:
                    week[day]['time_start'].append(currentDay.time_start[0])
                    week[day]['time_end'].append(currentDay.time_end[0])
                    week[day]['date_start'].append(currentDay.date_start[0])
                    week[day]['date_end'].append(currentDay.date_end[0])
        else:
            if len(rw_prop) != 1 and 'holidays' in rw:
                return hol, week
            elif len(rw_prop) == 1 and 'holidays' in rw:
                currentDay = Day()
                currentDay.time_start.append('00:00')
                currentDay.time_end.append('24:00')
                currentDay.date_start.append('01-01-2000')
                currentDay.date_end.append('01-01-2100')
                week['ANY'] = currentDay.__dict__
                return hol, week
            if any('time_of_the_day_end' in sl for sl in rw):
                time_of_the_day_end = '24:00' if rw['time_of_the_day_end'] == '23:59' else rw['time_of_the_day_end']
            if any('day_of_the_week' in sl for sl in rw_prop):
                days = ['MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT', 'SUN']
                for every_day in days:
                    currentDay = Day()
                    currentDay.time_start.append(rw['time_of_the_day_start'])
                    currentDay.time_end.append(time_of_the_day_end)
                    currentDay.date_start.append(rw['date_start'].replace('.', '-'))
                    currentDay.date_end.append(rw['date_end'].replace('.', '-'))
                    if every_day not in week:
                        week[every_day] = currentDay.__dict__
                    else:
                        week[every_day]['time_start'].append(currentDay.time_start[0])
                        week[every_day]['time_end'].append(currentDay.time_end[0])
                        week[every_day]['date_start'].append(currentDay.date_start[0])
                        week[every_day]['date_end'].append(currentDay.date_end[0])
            elif 'h24' in rw:
                day = 'ANY'
                currentDay = Day()
                currentDay.time_start.append('00:00')
                currentDay.time_end.append('24:00')
                currentDay.date_start.append(None)
                currentDay.date_end.append(None)
                week[day] = currentDay.__dict__
            else:
                day = 'ANY'
                currentDay = Day()
                currentDay.time_start.append(rw['time_of_the_day_start'])
                currentDay.time_end.append(time_of_the_day_end)
                currentDay.date_start.append(rw['date_start'].replace('.', '-'))
                currentDay.date_end.append(rw['date_end'].replace('.', '-'))
                week[day] = currentDay.__dict__
        return hol, week



    def mvl_rw_parse(self, rw_prop):
        if self.is_notam(rw_prop):
            return

        week, weekday, result, hol = self.set_schedule(rw_prop)
        days = list(flatten(weekday))
        st_dates = list(flatten(result[2]))
        end_dates = list(flatten(result[3]))
        st_times = list(flatten(result[0]))
        end_times = list(flatten(result[1]))
        return week, hol, days, st_dates, end_dates, st_times, end_times

    def updating_rw(self, table):
        pass

    def get_update_query(self, uuid):
        """
        не использовать пока не ясно по какому признаку определять нужную для обновления
        """
        return self.get_close_query(uuid, self.validTimeBegin)

    def get_close_query(self, uuidairspc, validTimeEnd):
        """
        для расписания нет таблиц с validTime для закрытия
        - как понимать что нужное расписание из внесенных - хз
        (условно после 3 обновления расписания у нас будет всего 4 расписания по аэропроту)
        апд. обновление через смену idPropertiesWithSchedule у эирспейса
        """
        return 'select 1'
