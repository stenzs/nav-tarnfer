height_aixm = {
    'high': 'UPPER',
    'both': 'BOTH',
    'low': 'LOWER',
}
srid_type = {
    'ADI': '4201',
    'AFG': '4205',
    'AIA': '4601',
    'AIN': '4204',
    'AMA': '4169',
    'ARF': '4209',
    'ARS': '4210',
    'ASC': '4712',
    'ASM': '4604',
    'BAT': '4813',
    'BER': '4216',
    'BID': '4165',
    'BOO': '4802',
    'BUR': '4219',
    'CAC': '4717',
    'CAI': '4221',
    'CAP': '4222',
    'CAZ': '4715',
    'CCD': '4156',
    'CGE': '4223',
    'CHI': '4672',
    'CHU': '4224',
    'COA': '5524',
    'DAL': '4155',
    'DID': '4736',
    'EAS': '4719',
    'EUR': '4230',
    'EUS': '4668',
    'GAA': '4684',
    'GAN': '4685',
    'GRX': '4120',
    'GSE': '4613',
    'GUA': '4675',
    'HEN': '4255',
    'HIT': '4254',
    'HJO': '4658',
    'HKD': '4738',
    'HTN': '4236',
    'IBE': '4714',
    'INF': '4239',
    'ING': '4131',
    'INH': '4240',
    'JOH': '4725',
    'KAN': '4244',
    'KEA': '4245',
    'KEG': '4698',
    'KUS': '4735',
    'LEH': '4250',
    'LIB': '4251',
    'LUZ': '4253',
    'MAS': '4262',
    'MER': '4261',
    'MID': '4727',
    'MIK': '4756',
    'MIN': '4263',
    'MOD': '4806',
    'MPO': '4266',
    'MVS': '4731',
    'NAH': '4270',
    'NAP': '4271',
    'NAR': '4269',
    'NAS': '4267',
    'NSD': '4307',
    'OEG': '4229',
    'OGB': '4277',
    'OHA': '4135',
    'PHA': '4713',
    'PIT': '4729',
    'PLN': '4728',
    'POS': '4615',
    'PRD': '27493',
    'PTB': '4620',
    'PTN': '4282',
    'PUK': '4284',
    'PUR': '4139',
    'QAT': '4285',
    'QUO': '4287',
    'REU': '4626',
    'RPE': '7677',
    'RTS': '4124',
    'SAE': '4730',
    'SAN': '4618',
    'SAP': '4292',
    'SCK': '4293',
    'SGM': '4616',
    'SHB': '4710',
    'SPK': '4284',
    'SRL': '4175',
    'STO': '4814',
    'TAN': '4297',
    'TDC': '4734',
    'TIL': '4298',
    'TOY': '4301',
    'TRI': '4302',
    'TRN': '4707',
    'UNK': '4326',
    'U': '4326',
    'VOI': '4304',
    'VOR': '4304',
    'WAK': '4733',
    'WGB': '4760',
    'WGC': '4322',
    'WGE': '4326',
    'YAC': '4309',
    'ZAN': '4311',

    'RP1': '7679',
    'S95': '4200',
    'PZ9': '4740',

    'GRS': '4121',
    'IGN': '6714',
    'NAW': '5498',
    'PRP': '4248',

    'ROM': '4806',
    'SAD': '4618',

    'TOK': '4301'
}

ReferenceType = {
    'AGL': 'SFC',
    'AMSL': 'MSL',
    'STD': 'STD'
}

uomdistance = {
    u'м': 'M',
}

vertical_datum = 'OTHER: Baltic height'

control_type = {
    u'совместного базирования': 'JOINT',
    u'государственной авиации': 'MIL',
    u'военный': 'MIL',
    u'гражданский': 'CIVIL',
    u'гидроаэродром': 'CIVIL',
    u'частный': 'OTHER: PRIVATE'}

abandoned = {u'закрыт': 'YES',
             u'открыт': 'NO'}

uomfrequency = {
    'MHz': 'MHZ',
    'kHz': 'KHZ'}

# Descriptions:
# ACC Area Control Center
# ACP Airlift Command Post
# APP Approach Control
# ARR Arrival Control
# ATI Automatic Terminal Info Service (ATIS)
# AWI Airport Weather Information Broadcast (AWIB)
# AWO Automatic Weather Observing Service (AWOS)
# AWS Aerodrome Weather Information Services (AWIS)
# CCA Class C Airspace
# CLD Clearance Delivery
# CTA Control Area (Terminal)
# CTL Control
# DEP Departure Control
# DIR Director (Approach Control Radar)
# EMR Emergency
# GCO Ground Comm Outlet
# GND Ground Control
# HEL Helicopter Frequency
# INF Information
# MIL Military Frequency Zone (note 2)
# OPS Operations
# RDO Radio
# RDR Radar
# RMP Ramp/Taxi Control
# RSA Airport Radar Service Area (ARSA)
# TCA Terminal Control Area (TCA)
# TMA Terminal Control Area (TMA)
# TML Terminal
# TRS Terminal Radar Service Area (TRSA)
# TWR Tower, Air Traffic Control
# UAC Upper Area Control


unitType = {
    'AWS': 'MET',
    'APP': 'APP',
    'ATI': 'AOF',
    # не уверена - есть ATIS в InformationService - он куда больше подходит, можно идентифицировать по связке:
    # Unit.UnitType = AOF + InformationService.type == ATIS
    # ATI - автоматическая терминальная служба информации
    # AOF - аэронавигационная информационная служба
    'ACC': 'ACC',
    'ARR': 'APP_ARR',
    'AWO': 'MWO',
    # не уверена - есть AWOS в InformationService - он куда больше подходит, можно идентифицировать по связке:
    # Unit.UnitType = MWO + InformationService.type == AWOS
    # AWO - автоматическая служба наблюдения за погодой
    # MWO - служба метеорологических наблюдений
    'CTF': 'ADVC',
    'CTL': 'ACC',
    # не уверена
    # CTL - control - просто какой-то Контроль, видимо любой
    # ACC - Area Control Center
    # можно идентифицировать CTL по связке в таблице Unit = ACC, в таблице AirTrafficControlService = ACS
    # (ACS - En-route area control service)
    'DEP': 'APP_DEP',
    'DIR': 'PAR',
    'EMR': 'SAR',  # не уверена:
    # emergency services - это экстренные службы (полиция, пожарные),
    # SAR - служба поиска и спасения, может лучше даже пожарные взять FireFighting -?
    'FSS': 'FSS',
    'GND': 'GCA',  # не уверена
    # GND - контроль с земли
    # GCA - службы контролируемого с земли захода на посадку
    'INF': 'FIC',
    'MBZ': 'BS',  # не уверена
    # MBZ - обязательная (или мандатная) зона вещения
    # BS - коммерческая станция вещения
    'MIL': 'MIL',
    'RDR': 'RAD',
    'TMA': 'OTHER: TMA',
    'TCA': 'OTHER: TCA',
    'TRS': 'TAR',  # не уверена
    # TRS - территория терминальной радарной службы
    # TAR - территория обзорной радиолокационной станции
    'TWR': 'TWR',
    # GCO - Ground communication outlet
    # COM - Communications office/centre
    'GCO': 'COM',
    'CLD': 'OTHER: CLD',
    'CTA': 'OTHER: CTA',
    'RMP': 'OTHER: RMP',
    'RDO': 'OTHER: RDO',
    'OPS': 'OTHER: OPS',
    'TML': 'OTHER: TML',
    'ACP': 'OTHER: ACS',
    'AWI': 'OTHER: AWI',
    'CCA': 'OTHER: CCA',
    'RSA': 'OTHER: RSA',
    'HEL': 'OTHER: HEL',
    'UNI': 'BS',
    'UAC': 'UAC',
    'Наблюдение за фактической погодой': 'MWO',
    'Наблюдение и составление прогнозов': 'RAFC',
    'Составление прогнозов': 'FCST',
    'VOL': 'MET'
    # над всеми этими other надо подумать
}

InformationServiceType = {
    'AWS': 'TAF',
    'AWI': 'TWEB',
    'ASO': 'ASOS',
    'ATI': 'ATIS',
    'AWO': 'AWOS',
    'INF': 'AIS',
    'AIR': 'OTHER: AIR',
    'TWE': 'TWEB',
    'VOL': 'VOLMET',
    'Наблюдение за фактической погодой': 'METAR',
    'Наблюдение и составление прогнозов': 'RAF',
    'Составление прогнозов': 'TAF',
    'HEL': 'AIS',
    'CTA': 'OTHER: CTA',
    'MIL': 'OTHER: MIL',
    'OPS': 'OTHER: OPS',
    'RDO': 'OTHER: RDO',
    'RDR': 'OTHER: RDR',
    'RSA': 'OTHER: RSA',
    'TCA': 'OTHER: TCA',
    'TMA': 'OTHER: TMA',
    'TML': 'OTHER: TML'
    # 'TRS': 'OTHER: TRS',
    # 'DIR': 'OTHER: DIR',
    # 'GCO': 'OTHER: GCO',
    # 'CCA': 'OTHER: CCA'
}

ATCServiceType = {
    'ACP': 'ACS',  # не уверена
    # ACP - командный пункт воздушных перевозок
    # ACS - сервис управления маршрутным пространством
    'ACC': 'OTHER: ACC',
    'APP': 'APP',
    'ARR': 'APP',
    'CTF': 'ADVS',
    'CTL': 'ACS',
    'DEP': 'APP',
    'TWR': 'TWR',
    'UAC': 'UAC'}

# В таблице GroundTrafficControlService в типе Сервиса тоже есть такое значение как TWR
# (ссылка: webprisme.cfmu.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeServiceGroundControlBaseType),
# поэтому не понятно куда лучше заносить TWR в AirTrafficControlService или в GroundTrafficControlService?
GroundControlServiceType = {
    'GND': 'SMGCS',
    'CPT': 'TAXI',
    'CLD': 'TAXI',
    'RMP': 'TAXI'}

fir_area = {
    u'FIR': 'FIR',
    u'FIR/UIR': 'OTHER: FIR/UIR',
    u'UIR': 'UIR',
    u'ВМДП': 'OTHER: VMDP',
    u'МДП': 'OTHER: MDP',
    u'КДП': 'OTHER: KDP'
}

day_of_week = {
    u'Пн': 'MON',
    u'Вт': 'TUE',
    u'Ср': 'WED',
    u'Чт': 'THU',
    u'Пт': 'FRI',
    u'Сб': 'SAT',
    u'Вс': 'SUN',
    u'Пн-Пт': 'WORK_DAY',
    u'ПнВтСрЧтПтСбВс': 'ANY',
    u'ПнВтСрЧтПт': 'WORK_DAY'
}

reportingATC = {
    u'ПОД': 'COMPULSORY',
    u'ПДЗ': 'ON_REQUEST'}

navaidtype = {
    'NDB': 'NDB',
    'DME': 'DME',
    'VORDME': 'VOR_DME',
    'ILSDME': 'ILS_DME',
    'VORTAC': 'VORTAC',
    'TACAN': 'TACAN',
    'VOR': 'VOR',
    'MILTACAN': 'OTHER: MILTACAN',
    'MilitaryTacan': 'OTHER: MILTACAN',
    'РСБН': 'OTHER: RSNN',
    'GBAS': 'OTHER: GBAS'}

composition = {
    u'асфальт': 'ASPH',
    u'искусственное покрытие (бетон)': 'CONC',
    u'искусственное покрытие (бетонированная площадка)': 'CONC',
    u'искусственное покрытие (асфальт)': 'ASPH',
    u'искусственное покрытие (цемент)': 'BITUM',
    u'искусственное покрытие (металл)': 'METAL',
    u'бетонированная площадка': 'CONC',
    u'бетон': 'CONC',
    u'искусственное покрытие': 'CONC_ASPH',
    u'глина': 'CLAY',
    u'трава': 'GRASS',
    u'гравий': 'GRAVEL',
    u'щебень': 'MACADAM',
    u'искусственное покрытие (щебень)': 'MACADAM',
    u'песок': 'SAND',
    u'цемент': 'BITUM',
    u'битум': 'BITUM',
    u'искусственное покрытие (битум)': 'BITUM',
    u'снег': 'SNOW',
    u'грязь': 'EARTH',
    u'лёд': 'ICE',
    u'искусственное покрытие (дробленый камень со смолой)': 'BITUM',
    u'почва/грунт (без конкретизации)': 'EARTH',
    u'искусственное покрытие (асфальто-бетон)': 'CONC_ASPH',
    u'искусственное покрытие (металл (сталь, алюминий))': 'METAL',
    u'искусственное покрытие (другое)': 'OTHER',
    u'искусственное покрытие (асфальт и трава)': 'ASPH_GRASS',
    u'другое': 'OTHER',
    u'торф': 'EARTH',
    u'искусственное покрытие (бетон и трава)': 'OTHER',
    u'искусственное покрытие (гравий)': 'MACADAM',
    u'искусственное покрытие (твёрдое покрытие (без конкретизации))': 'OTHER',
    u'искусственное покрытие (трава)': 'GRASS',
    u'нетвёрдое покрытие (без конкретизации)': 'OTHER',
    u'вода': 'WATER',
    u'искусственное покрытие (камень)': 'STONE',
    u'кораллы': 'CORAL',
    u'латерит': 'LATERITE',
    u'герметизированное покрытие': 'OTHER'
}

als_type = {u'вертодром': 'HP',
            u'посадочная площадка': 'LS',
            u'вертолетная площадка': 'OTHER: helipad'}

# SLAG HEAP - террикон
# РДМ - рулежно-демпфирующий механизм
# БСС - береговое стабилизационное сооружение?
# ПРС - промежуточная релейная станция?
obstype = {
    u'БСС': 'OTHER',
    u'ВОЗДУШНЫЙ|ВОЗДУШНОГО|ВОЗДУХООТБОЙНИК|ВОЗДУХОВОД': 'COMPRESSED_AIR_SYSTEM',
    u'МАЧТ|СТОЛБ|ФЛАГШТОК|ОПОР[А|Ы]|MAST|POLE|BEARING|SUPPORT': 'POLE',
    u'ВОДОНАПОРНАЯ|ВОДОНАП|В/Н|(?<!\w)ВОД\.|WATER ': 'WATER_TOWER',
    u'(?<!ВОДОНАПОРНАЯ )БАШНЯ|(?<!БУРОВАЯ )ВЫШКА|(?<!НЕФТЯНАЯ )ВЫШКА|(?<!WATER )TOWER|BASHNYA|TWR': 'TOWER',
    u'КДП|ДИСПЕТЧЕРСКАЯ|KDP': 'CONTROL_TOWER',
    u'(?<!МАЧТА )АНТЕНН[А|О|Ы]|ANTENN[A|Y]': 'ANTENNA',
    u'КУПОЛ|(?!RADOME)DOME': 'DOME',
    u'(?<!Э)КРАН|CRANE': 'CRANE',
    u'(?<!\()МАЯК|ОГНИ (?<!.ПАПИ)|BEACON|MAYAK|LIGHTHOUSE|SEARCHLIGHT|LANTERN': 'LIGHTHOUSE',
    u'(?<!\w)АМС(?!Г)|\bAMS': 'POLE',
    u'ТРУБ|CHIMNEY|TRUBA|STACK': 'STACK',
    u'ЛЭП|ЛИНИЯ ЭЛЕКТРОПЕРЕДАЧИ|LINE POWER|TRANSMISSION LINE|ELECTRIC LINE|TRANSMISSION|ВЫСОКОВ. ЛИНИЯ': 'TRANSMISSION_LINE',
    u'ЗНАК|ВЫВЕСКА|ЩИТ|КРЕСТ|ЛОГОТИП|МАРКЕР|УКАЗАТЕЛЬ|ТАБЛИЧКА|SIGN': 'SIGN',
    u'(?<!АНТЕННА )ЗДАНИ[Е|Я|И]|(?<!\w)(ДОМ|ДОМОВ|ДОМА|ЖК)(?!\w)|ОБЩЕЖИТИЕ|(ДОМ[А|ОВ] )': 'BUILDING',
    u'ШКОЛА|ЛИЦЕЙ|ЖИЛОЙ|МАГАЗИН|ПОСТРОЙК|СТРОЕНИЕ|СТРОЯЩ|ВОКЗАЛ|ТЕАТР|ГОСТИНИЦА|ТРК|КЛУБ|МУЗЕЙ': 'BUILDING',
    u'BUILDING|BOX|HOTEL|CHURCH|BULDING|ТОРГОВЫЙ КОМПЛЕКС|ПОЛИКЛИНИКА|СОБОР|ЦЕРКОВЬ|ХРАМ|ЗДАНИЙ': 'BUILDING',
    u'ЖИЛ.КОМПЛЕКС|ГРУППА ЗДАНИЙ|CATHEDRAL|MOSQUE|ЧАСОВНЯ|DWELLING|HOUSE|ОТЕЛЬ|CATHEDRAL': 'BUILDING',
    u'(?<!ВЫШКА )ГСМ|ТОПЛИВНО-РАСПРЕДЕЛИТЕЛЬНАЯ СИСТЕМА': 'FUEL_SYSTEM',
    u'БУРОВ[АЯ|ОЙ]|НЕФТЯНОЕ МЕСТОРОЖДЕНИЕ|(?!RIGA)RIG|BUROVAYA': 'RIG',
    u'АРКА ': 'ARCH',
    u'РЕЗЕРВУАР|ЦИСТЕРН|TANK|FUEL STORAGE': 'TANK',
    u'ЛЕС|РАСТИТЕЛЬНОСТЬ|(?<!А)КУСТ|FOREST|ПОРОСЛЬ': 'VEGETATION',
    u'БПРМ|ВОР/ДМЕ|ВОР-ДМЕ|ДПРМ|ОПРС|РАДИОНАВИГАЦИОННОЕ|NAVAID|DME|\bILS': 'NAVAID',
    u'ВЕТРЯНАЯ МЕЛЬНИЦА|WINDMILL': 'WINDMILL',
    u'ВЕТРЯНАЯ ЭЛЕКТРОСТАНЦИЯ|ВЕТРОЭНЕРГ|ВЭУ|ВЕТРОГЕНЕРАТОР|WIND ENERGETIC|WIND TURBINE|ВЕТРЯНОЙ ДВИГАТЕЛЬ|WIND POWER STATIONS': 'WINDMILL_FARMS',
    u'ГАЗООТБОЙНИК|ГАЗОТРАНСПОРТНАЯ СИСТЕМА|ГРМ': 'NATURAL_GAS_SYSTEM',
    u'ДЕРЕВЬ|ДЕРЕВО|(?<!\w)ДЕР(?!ЕВЯН)|\bTREE|ЕЛЬ': 'TREE',
    u'ГИДРАНТ': 'SALTWATER_SYSTEM',
    u'ГРАДИРНЯ': 'COOLING_TOWER',
    u'(?<!МЕТЕОВИДИ)МОСТ|BRIDGE': 'BRIDGE',
    u'(?<!ВОДО)ЗАБОР|ОГРАЖДЕНИЕ|FENCE|ОГРАДА': 'FENCE',
    u'КРМ|РЕТРАНСЛЯТОР|ТП|ТРАНСФОРМАТОР|RELAY|RETRANSLATOR|ELECTRICAL SYSTEM': 'ELECTRICAL_SYSTEM',
    u'ЗЕРНОВОЙ ЭЛЕВАТОР': 'GRAIN_ELEVATOR',
    u'ЭЛЕВАТОР': 'AG_EQUIP',
    u'КАНАТНАЯ ДОРОГА': 'CABLE_CAR',
    u'КОЛОНН|МОНУМЕНТ|МЕМОРИАЛ|ОБЕЛИСК|ПАМЯТНИК|СТЕЛЛА|MONUMENT': 'MONUMENT',
    u'НПЗ': 'REFINERY',
    u'ОСВЕТИТЕЛЬ(?!НАЯ МАЧТА)|ПРОЖЕКТОР|ФОНАР': 'ELECTRICAL_EXIT_LIGHT',
    u'ОЧИСТНЫЕ СООРУЖЕНИЯ': 'WASTEWATER_SYSTEM',
    u'ПОДЪЁМНИК|ЛИФТ|ELEVATOR': 'ELEVATOR',
    u'СТЕНА|WALL': 'WALL',
    u'ТЭЦ|ТУРБИНА|ЭЛ. ПОДСТАНЦИЯ|ЭЛ.ПОДСТАНЦИЯ|ЭЛЕКТРОПОДСТАНЦИЯ|ЭЛЕКТРОСТАНЦИЯ|ЭЛЕКТРИЧЕСКАЯ ПОДСТАНЦИЯ|ПОДСТАНЦИЯ|ГРЭС|POWER PLANT': 'POWER_PLANT',
    u'ШПИЛЬ|SPIRE': 'SPIRE',
    u'ВЫСОТА|\bГОРА|ОТМ.|ОТМЕТКА|\bПИК|ГОРЫ|Г\.|G\.|СОПКА|NATURAL HIGHTPOINT|RELIEF|HILL|ЕСТЕСТВЕННОЕ ПРЕПЯТСТВИЕ': 'NATURAL_HIGHPOINT',
    u'HUMMOCK|ВОЗВЫШЕННОСТЬ|ВЕРШИНА|ХОЛМ|MOUNTAIN|СКЛОН|SLOPE|ПЕРЕВАЛ|РЕЛЬЕФ|ХРЕБЕТ': 'NATURAL_HIGHPOINT',
    u'ЯДЕРНЫЙ РЕАКТОР': 'NUCLEAR_REACTOR',
    u'ОХЛАЖД|HEAT COOL|HEATCOOLSYSTEM': 'HEAT_COOL_SYSTEM',
    u'ГОРОДСКАЯ ТЕРРИТОРИЯ|МИКРОРАЙОН|URBAN': 'URBAN',
    u'СТАДИОН': 'STADIUM',
    u'ТРОС': 'CATENARY',
    u'СИСТЕМА МОНИТОРИНГА|CONTROL MONITORING SYSTEM': 'CONTROL_MONITORING_SYSTEM',
    'WATER TOWER': 'WATER_TOWER'
}
classLighting = {
    'есть': 'BALS',
    'нет': 'NALS',
    'неизвестно': None
}
classLighting_nill = {
    'неизвестно': 'unknown'
}

translate_le = {
    'есть': 'YES',
    'нет': 'NO'
}
inbound_types = {
        'TRUE': 'TRUE_TRACK',
        'MAG': 'MAG_TRACK'
}
grid_types = {
        'горный': 'mountainous',
        'равнинный': 'flat'
}
