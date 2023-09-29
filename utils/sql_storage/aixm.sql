--
-- CLEANING DATABASE
--
DROP DOMAIN IF EXISTS id, CodeAirportHeliportDesignatorType, TextNameType, CodeICAOType, CodeIATAType, CodeVerticalDatumType,
ValMagneticVariationType, ValAngleType, DateYearType, ValMagneticVariationChangeType, DateType, CodeOrganisationDesignatorType,
TextDesignatorType, TextInstructionType, DateTimeType, ValFrictionType, TimeType, ValPercentType, latitude, longitude,
ValLCNType, ValWeightBaseType, ValBearingType, textaddresstype, CodeAirspaceDesignatorType, NoNumberType, codenavaiddesignatortype,
CodeMilitaryStatusType, CodeMilitaryOperationsType, CodeRunwaySectionType, CodeSideType, CodeDirectionTurnType,
CodeRunwayMarkingType, CodeMarkingConditionType, CodeLightingJARBaseType, CodeApproachGuidanceType, CodeLightIntensityType,
CodeColourType, CodeTelecomNetworkType, CodeFlightDestinationType, CodeFacilityRankingType, CodeServiceATFMType,
CodeServiceInformationType, CodeServiceSARType, CodeAirspaceType, CodeAirspaceClassificationType, CodeVerticalReferenceType,
CodeAltitudeUseType, CodeRouteDesignatorPrefixType, CodeRouteDesignatorLetterType, CodeUpperAlphaType, CodeRouteType,
CodeFlightRuleType, CodeRouteOriginType, CodeMilitaryStatusType, uomfrequencytype, CodeServiceGroundControlType,
codeserviceatctype, valdistanceverticalbasetypenonnumeric, CodeAircraftGroundServiceType, CodeUnitType, CodeTimeReferenceType,
CodeDayType, CodeTimeEventType, UomDurationType, CodeTimeEventCombinationType, datemonthdaytype, CodeYesNoBaseType,
UomDistanceVerticalType, UomTemperatureType, CodeAirportHeliportType, UomDistanceType, UomFLType, CodeStatusOperationsType,
CodeOrganisationType, UomDepthType, CodeFrictionEstimateType, CodeFrictionDeviceType, CodeStatusAirportType,
CodeAirportWarningType, CodeRunwayType, CodeSurfaceCompositionBaseType, CodeSurfacePreparationType, CodeSurfaceConditionType,
CodePCNPavementType, CodePCNSubgradeType, CodePCNTyrePressureType, CodePCNMethodType, UomWeightType, UomPressureType,
CodeMilitaryTrainingType, CodeAirspaceActivityType, CodeStatusAirspaceType, CodeAirspacePointRoleType,
CodeAirspacePointPositionType, CodeLevelType, CodeRouteSegmentPathType, CodeRouteNavigationType, CodeRouteDesignatorSuffixType,
CodeATCReportingType, CodeFreeFlightType, CodeRVSMPointRoleType, CodeMilitaryRoutePointType, CodeCommunicationModeType,
CodeRadioEmissionType, CodeCommunicationDirectionType, CodeUnitDependencyType, CodeAuthorityType, CodeNavaidServiceType,
CodeNavaidPurposeType, CodeSignalPerformanceILSType, CodeCourseQualityILSType, CodeIntegrityLevelILSType,
CodeDesignatedPointDesignatorType, CodeDesignatedPointType, CodeMLSAzimuthType, CodeMLSChannelBaseType, CodeDMEType,
CodeDMEChannelType, CodeILSBackCourseType, CodeMarkerBeaconSignalType, CodeAuralMorseType, CodeNDBUsageType, CodeEmissionBandType,
CodeTACANChannelType, CodeVORType, CodeNorthReferenceType, codemlschanneltype, CodeObstacleAreaType,
CodeObstacleAssessmentSurfaceType, CodeVerticalStructureType, CodeStatusConstructionType, CodeVerticalStructureMarkingType,
CodeVerticalStructureMaterialType, TimesliceInterpretationType, CodeDesignStandardType, CodeProcedureCodingStandardType,
nilreasonverticaltype, CodeHoldingUsageBaseType, NilReasonEnumeration, CodeCourseBaseType, ValSpeedBaseType, UomSpeedType,
CodeNotePurposeBaseType, CodeDirectionBaseType, CodeCardinalDirectionBaseType, CodeStatusServiceType, CodeProcedureFixRoleType,
CodeRouteAvailabilityBaseType, coderunwaypointrolebasetype, CodeReferenceRoleBaseType, CodeBearingBaseType,
CodeDistanceIndicationBaseType, CodeProcedurePhaseBaseType, CodeApproachPrefixBaseType, CodeApproachBaseType,
CodeApproachEquipmentAdditionalBaseType, CodeMissedApproachBaseType, TextSIDSTARDesignatorBaseType, Character1Type,
ValChannelNumberBaseType, NoSequenceBaseType, CodeSegmentTerminationBaseType, CodeTrajectoryBaseType, CodeSegmentPathBaseType,
CodeDirectionReferenceBaseType, CodeSpeedReferenceBaseType, CodeAircraftCategoryBaseType,
CodeSpecialNavigationSystemBaseTypeBaseType, TextInstructionBaseType, CodeSafeAltitudeBaseType, CodeArcDirectionBaseType
CASCADE;

DROP TYPE IF EXISTS CodeAirportHeliportType, uomtemperaturetype, valflbasetype, valdistancebasetype,
ValDistanceVerticalType, valdistanceverticalbasetype, ValTemperatureType, ValFLType, ValDistanceSignedType, ValDistanceType,
ValDepthType, ValSlopeType, ValWeightType, ValPCNType, textdesignatortype, valpressuretype, textphonetype, codernptype,
codelanguagetype, valfrequencybasetype, valfrequencytype, codecommunicationchanneltype, ValDurationType, codegradeseparationtype,
coderunwayelementtype, CodeHoldingUsageType, CodeCourseType, ValSpeedType, CodeNotePurposeType, CodeDirectionType,
CodeCardinalDirectionType, CodeRouteAvailabilityType, CodeLightingJARType, CodeSurfaceCompositionType,
CodeYesNoType, coderunwaypointroletype, CodeReferenceRoleType, CodeBearingType, CodeDistanceIndicationType, CodeProcedurePhaseType,
CodeApproachPrefixType, CodeApproachType, CodeApproachEquipmentAdditionalType, ValChannelNumberType, NoSequenceType,
CodeMissedApproachType, TextSIDSTARDesignatorType, CodeSegmentTerminationType, CodeTrajectoryType, CodeSegmentPathType,
CodeDirectionReferenceBaseType, CodeSpeedReferenceType, CodeAircraftCategoryType, CodeDirectionReferenceType,
CodeSpecialNavigationSystemType, IncludingValueType, TextInstructionType, CodeSafeAltitudeType, CodeArcDirectionType
CASCADE;

DROP FUNCTION if EXISTS dd2dms(p_ddecdeg double precision, laltlon varchar) CASCADE;

DROP FUNCTION IF EXISTS trigger_insert_service();
DROP FUNCTION IF EXISTS trigger_insert_Point();
DROP FUNCTION IF EXISTS trigger_update_cartographylabel();
DROP FUNCTION IF EXISTS trigger_insert_polygon();

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS dblink;
--
-- CREATE DOMAINS
--

-- В качестве id используем UUID Type
--
-- http://www.postgresql.org/docs/9.3/static/datatype-uuid.html
CREATE DOMAIN id AS UUID;
CREATE DOMAIN NilReasonEnumeration AS VARCHAR(60) CHECK ((VALUE) ~ '(inapplicable|missing|template|unknown|withheld|other)');
create domain CodeRunwayElementType as varchar(40)
  constraint CodeRunwayElementType_check check ((VALUE)::text ~ '((UNDERPASS|OVERPASS|)|OTHER: [A-Z]{0,30})'::text);

create domain CodeProcedureFixRoleType as varchar(40)
  constraint CodeProcedureFixRoleType_check check ((VALUE)::text ~ '((FAF|FPAP|FROP|FTP|IAF|IF|IF_IAF|LTP|MAHF|MAPT|SDF|TP|VDP|)|OTHER: [A-Z]{0,30})'::text);

create domain CodeGradeSeparationType as varchar(40)
  constraint CodeGradeSeparationType_check check ((VALUE)::text ~ '((UNDERPASS|OVERPASS|)|OTHER: [A-Z]{0,30})'::text);

-- Уникальный индификатор для аэродрома/вертодрома.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAirportHeliportDesignatorType

CREATE DOMAIN CodeAirportHeliportDesignatorType AS VARCHAR(10)
CHECK (VALUE ~ '([A-Z]|\d){3,6}');

-- Используется для названий с максимальной длиной в 60 символов.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_TextNameType
CREATE DOMAIN TextNameType AS VARCHAR(120);


-- A full free text address.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_TextAddressBaseType
CREATE DOMAIN TextAddressType AS VARCHAR(500);

-- Четырехбуквенный индекс аэродрома ICAO (http://en.wikipedia.org/wiki/International_Civil_Aviation_Organization_airport_code)
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeICAOType
CREATE DOMAIN CodeICAOType AS CHAR(4)
CHECK (VALUE ~ '[A-Z]{4}|NULL');

-- Трехбуквенный индекс аэродрома IATA (http://en.wikipedia.org/wiki/International_Air_Transport_Association_airport_code)
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeIATAType

CREATE DOMAIN CodeIATAType AS CHAR(3)
CHECK (VALUE ~ '[A-Z]{3}');

/*
Тип объекта Аэродром/Вертодром:
AD - только аэродром
АН - аэродром и вертодром
НР - только вертодром
LS - посадочная площадка

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAirportHeliportType
*/
CREATE DOMAIN CodeAirportHeliportType AS VARCHAR(60)
CHECK (VALUE ~ '(AD|AH|HP|LS|OTHER: [A-Z]{0,30})');
/*
Тип данных для хранения значений: Да или Нет

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeYesNoType
*/
CREATE DOMAIN CodeYesNoBaseType AS VARCHAR(60) CHECK (VALUE ~ '(YES|NO|OTHER: [A-Z]{0,30})');
CREATE TYPE CodeYesNoType AS (
  nilReason NilReasonEnumeration,
  value CodeYesNoBaseType
);

/*
Признак принадлежности к военным:
CIVIL - только гражданская авиация
MIL - только военная авиация
JOINT - совместного использования

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeMilitaryOperationsType
*/
CREATE DOMAIN CodeMilitaryOperationsType AS VARCHAR(60)
CHECK (VALUE ~ '(MIL|CIVIL|JOINT|OTHER: [A-Z]{0,30})');

-- A unit of measurement for a vertical distance:
-- FT - feet
-- M - meters
-- FL - flight level in hundreds of feet
-- SM - standard meters (tens of meters)
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_UomDistanceVerticalType
CREATE DOMAIN UomDistanceVerticalType AS VARCHAR(60)
CHECK (VALUE ~ '(FT|M|FL|SM|OTHER: [A-Z]{0,30})');


/*
Значение расстояния по вертикали (например: верхние и нижние границы воздушного пространства).
Этот тип данных также допускает некоторые специфические не числовые значения:
GND - значение "Поверхность Земли"
UNL - значение "неограниченный"
FLOOR - значение "основание (дно) воздушного пространства", необходимо отображать использование (?) для воздушного пространства с непостоянной нижней границей
CEILING - значение "верх воздушного пространства", необходимо отображать использование (?) для воздушного пространства с непостоянной верхней границей

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValDistanceVerticalType
*/
CREATE DOMAIN ValDistanceVerticalBaseType AS DECIMAL(12, 4);
CREATE DOMAIN ValDistanceVerticalBaseTypeNonNumeric AS VARCHAR(40) CHECK (VALUE ~
                                                                          '((UNL|GND|FLOOR|CEILING)|OTHER: [A-Z]{0,30})');
CREATE DOMAIN nilreasonverticaltype AS VARCHAR(60) CHECK ((VALUE) ~ '(inapplicable|missing|template|unknown|withheld|other)');

CREATE TYPE ValDistanceVerticalType AS (
  value      ValDistanceVerticalBaseType,
  nonNumeric ValDistanceVerticalBaseTypeNonNumeric,
  unit       UomDistanceVerticalType,
  nilReason nilreasonverticaltype
);

/*
Вообще в AIXM приведены три используемых датума: EGM_96, AHD (Australian Height Datum),
NAVD88 (North American Vertical Datum of 1988), но я думаю что, возможно гораздо больше вариантов
EMG_96 - геопотенциальная модель земного шара 1996 года
AHD - австралийский высотный датум
NAVD88 - северо-американский высотный датум 1988 года

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeVerticalDatumType
*/
CREATE DOMAIN CodeVerticalDatumType AS VARCHAR(60)
CHECK (VALUE ~ '(EGM_96|AHD|NAVD88|OTHER: [A-Z]{0,30})'); --EMG_96

-- Значение угла в данной точке между направлением на магнитный север и направлением на географический север.
-- Положительное значение показывает, что магнитный север восточнее географического.
-- Отрицательное значение показывает, что магнитный север западнее географического.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValMagneticVariationType
CREATE DOMAIN ValMagneticVariationType AS DECIMAL(13, 10)
CHECK (VALUE >= -180 AND VALUE <= 180);

-- Значение угла.
-- предлагаю объединить этот тип с предыдущим и сделать один, так как они одинаковые
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValAngleType
CREATE DOMAIN ValAngleType AS DECIMAL(13, 10)
CHECK (VALUE >= -180 AND VALUE <= 180);

-- Дата, в которой значимым является только год.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_DateYearType
CREATE DOMAIN DateYearType AS SMALLINT
CHECK (VALUE > 1000 AND VALUE <= 9999);

-- Величина годового изменения магнитного склонения, единицы измерения - градус/год.
-- вообще всё описание такое же, как у типа ValAngleType, хоть и ед-цы измерения разные, можно объединить
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValMagneticVariationChangeType
CREATE DOMAIN ValMagneticVariationChangeType AS DECIMAL(13, 10)
CHECK (VALUE >= -180 AND VALUE <= 180);

-- Единицы измерения температуры.
-- C - degrees Celsius
-- F - degrees Fahrenheit
-- K - degrees Kelvin
--
--https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_UomTemperatureType
CREATE DOMAIN UomTemperatureType AS VARCHAR(60)
CHECK (VALUE ~ '(C|F|K|OTHER: [A-Z]{0,30})');

-- Значение температуры.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValTemperatureType
CREATE TYPE ValTemperatureType AS (
  value DECIMAL(13, 10),
  unit  UomTemperatureType
);

-- Unit of measurement for flight levels
-- FL - flight level in hundreds of feet
-- SM - standard meters (tens of meters)
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_UomFLType
CREATE DOMAIN UomFLType AS VARCHAR(60)
CHECK (VALUE ~ '(FL|SM|OTHER: [A-Z]{0,30})');

-- A value expressed in flight levels (FL).
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValFLType
CREATE DOMAIN ValFLBaseType AS SMALLINT
CHECK (VALUE < 999);
CREATE TYPE ValFLType AS (
  value ValFLBaseType,
  unit  UomFLType
);

-- Дата по календарю.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_DateType
CREATE DOMAIN DateType AS DATE;

-- A unit of measurement for a horizontal distance.
-- For example, metres, feet, nautical miles, kilometres, etc...
-- NM - морские мили
-- KM - километры
-- М - метры
-- FT - футы
-- MI - мили
-- CM - сантиметры
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_UomDistanceType
CREATE DOMAIN UomDistanceType AS VARCHAR(60)
CHECK (VALUE ~ '(NM|KM|M|FT|MI|CM|OTHER: [A-Z]{0,30})');

-- A signed distance.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValDistanceSignedType
CREATE TYPE ValDistanceSignedType AS (
  value DECIMAL(30, 20),
  unit  UomDistanceType
);

-- A type for (positive) distance.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValDistanceBaseType
CREATE DOMAIN ValDistanceBaseType AS DECIMAL(30, 20)
CHECK (VALUE >= 0);

-- A (positive) distance.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValDistanceType
CREATE TYPE ValDistanceType AS (
  value ValDistanceBaseType,
  unit  UomDistanceType,
  nilReason NilReasonEnumeration
);

-- Code indicating operational status:
-- NORMAL - стандартные операции
-- DOWNGRADED - система теоритически может работать на более высоком уровне, но в нынешнее время она ограничена описанным уровнем
-- UNSERVICEABLE - не пригодна для эксплуатации
-- WORK_IN_PROGRESS - работа налаживается (в ремонте) - under construction
--
--https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeStatusOperationsType
CREATE DOMAIN CodeStatusOperationsType AS VARCHAR(60)
CHECK (VALUE ~ '(NORMAL|DOWNGRADED|UNSERVICEABLE|WORK_IN_PROGRESS|OTHER: [A-Z]{0,30})');

-- Закодированный идентификатор организации, департамента, агенства или объединения.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeOrganisationDesignatorType
CREATE DOMAIN CodeOrganisationDesignatorType AS VARCHAR(12)
CHECK (VALUE ~ '([A-Z]|[0-9])+([ \+\-/]*([A-Z]|[0-9])+)*');

-- Код, указывающий на тип организации:
-- STATE - область
-- STATE_GROUP - группа областей
-- ORG - организация в области
-- INTL_ORG - международная организация
-- ACFT_OPR - авиационное агентство
-- HANDLING_AGENCY - транспортное агентство (или логистическое)
-- NTL_AUTH - национальный департамент
-- ATS - постащик услуг авиаперевозок
-- COMMERCIAL - другая коммерческая организация
--
--https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeOrganisationType
CREATE DOMAIN CodeOrganisationType AS VARCHAR(60)
CHECK (VALUE ~ '(STATE|STATE_GROUP|ORG|INTL_ORG|ACFT_OPR|HANDLING_AGENCY|NTL_AUTH|ATS|COMMERCIAL|OTHER: [A-Z]{0,30})');

-- Текстовое обозначение.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_TextDesignatorType
CREATE DOMAIN TextDesignatorType AS VARCHAR(16)
CHECK (VALUE ~ '([A-Z]|[0-9]|[, !"&#$%''\(\)\*\+\-\./:;<=>\?@\[\\\]\^_\|\{\}])*');

-- A textual description of a sequence of elementary steps.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_TextInstructionType
CREATE DOMAIN TextInstructionType AS VARCHAR(10000);

-- A full date and time value.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_DateTimeType

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeDesignStandardType
CREATE DOMAIN CodeDesignStandardType AS VARCHAR(40)
CHECK (VALUE ~ 'nilReason|PANS_OPS|TERPS|CANADA_TERPS|NATO|OTHER: [A-Z]{0,30}');

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeProcedureCodingStandardType
CREATE DOMAIN CodeProcedureCodingStandardType AS VARCHAR(40)
CHECK (VALUE ~ 'nilReason|PANS_OPS|ARINC_424_15|ARINC_424_18|ARINC_424_19|OTHER: [A-Z]{0,30}');

CREATE DOMAIN DateTimeType AS TIMESTAMP WITH TIME ZONE;

-- Единицы измерения глубины:
-- MM - миллиметры
-- СМ - сантиметры
-- IN - дюймы
-- FT - футы
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_UomDepthType
CREATE DOMAIN UomDepthType AS VARCHAR(60)
CHECK (VALUE ~ '(MM|CM|IN|FT|OTHER: [A-Z]{0,30})');

--Значение глубины.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValDepthType
CREATE TYPE ValDepthType AS (
  value DECIMAL(30, 20),
  unit  UomDepthType
);

-- Значение коэффициента трения.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValFrictionType
CREATE DOMAIN ValFrictionType AS DECIMAL(3, 2)
CHECK ( VALUE >= 0 AND VALUE <= 1);

-- Качественная оценка трения на ВВП:
-- GOOD - хорошее
-- MEDIUM_GOOD - среднее ближе к хорошему
-- MEDIUM - среднее
-- MEDIUM_POOR - среднее ближе к плохому
-- POOR - плохое
-- UNRELIABLE - состояние поверхности или доступного прибора измерения трения не позволяют провести надежные измерения трения поверхности
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeFrictionEstimateType
CREATE DOMAIN CodeFrictionEstimateType AS VARCHAR(60)
CHECK (VALUE ~ '(GOOD|MEDIUM_GOOD|MEDIUM|MEDIUM_POOR|POOR|UNRELIABLE|OTHER: [A-Z]{0,30})');

-- Типы оборудования, использованного для определения коэффициента трения на ВПП:
-- BRD - Brakemeter-Dynometer
-- GRT - Grip tester
-- MUM - Mu-meter
-- RFT -	Runway friction tester
-- SFH - Surface friction tester (high-pressure tire)
-- SFL	-	Surface friction tester (low-pressure tire)
-- SKL	-	Skiddometer (low-pressure tire)
-- TAP	-	Tapley meter
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeFrictionDeviceType
CREATE DOMAIN CodeFrictionDeviceType AS VARCHAR(60)
CHECK (VALUE ~ '(BRD|GRT|MUM|RFT|SFH|SFL|SKH|SKL|TAP|OTHER: [A-Z]{0,30})');

-- Время с точностью до 1 мин.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_TimeBaseType
CREATE DOMAIN TimeType AS CHAR(5)
CHECK (VALUE ~ '(([0-1][0-9]|2[0-3]):[0-5][0-9])|(24:00)');

-- A numerical value between 0.0 and 100, which designates a part or portion considered in its quantitative relation to the whole.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValPercentBaseType
CREATE DOMAIN ValPercentType AS DECIMAL(4, 1)
CHECK (VALUE >= 0 AND VALUE <= 100);

-- A coded list of values that indicates the availability of an airport/heliport facility for specific flight operations.
-- NORMAL - условия имеют формальные ограничения
-- LIMITED - наряду с формальными ограничениями, есть и дополнительные ограничения по использованию
-- CLOSED - не рабочее состояние
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeStatusAirportType
CREATE DOMAIN CodeStatusAirportType AS VARCHAR(60)
CHECK (VALUE ~ '(NORMAL|LIMITED|CLOSED|OTHER: [A-Z]{0,30})');

-- A code indicating a reason for caution in airport operations. For example, work in progress on a runway.
-- WIP - идут работы
-- EQUIP - люди и оборудование
-- BIRD - опасность в виде птиц
-- ANIMAL - опасность в виде животных
-- RUBBER_REMOVAL - уборка резиновых осадков с DGG (или каких-то резиновых отложений)
-- PARKED_ACFT - на площадке расположен припаркованный или вышедший из строя летательный аппарат
-- RESURFACING - работы по асфальтированию
-- PAVING - покрытие ВПП
-- PAINTING - разметка ВПП
-- INSPECTION - присутствие людей или оборудования из-за работ по обследованию наземного оборудования
-- GRASS_CUTTING - присутствие людей или оборудования из-за работ по стрижке газона
-- CALIBRATION - присутствие людей или оборудования из-за работ с наземным оборудованием
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAirportWarningType
CREATE DOMAIN CodeAirportWarningType AS VARCHAR(60)
CHECK (VALUE ~
       '(WIP|EQUIP|BIRD|ANIMAL|RUBBER_REMOVAL|PARKED_ACFT|RESURFACING|PAVING|PAINTING|INSPECTION|GRASS_CUTTING|CALIBRATION|OTHER: [A-Z]{0,30})');

-- Широта
--
CREATE DOMAIN latitude AS DECIMAL;

-- Долгота
--
CREATE DOMAIN longitude AS DECIMAL;

-- Код, который указывает что взлетная полоса предназначена для самолетов или для конечного этапа захода на посадку для вертолетов.
-- RWY - ВПП для самолетов
-- FATO - зона конечного этапа захода на посадку и взлета для вертолетов
--
--https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRunwayType
CREATE DOMAIN CodeRunwayType AS VARCHAR(60)
CHECK (VALUE ~ '(RWY|FATO|OTHER: [A-Z]{0,30})');

-- Код указывающий на материал ВПП.
-- ASPH - асфальт
-- ASPH_GRASS - асфальт и трава
-- CONC - бетон
-- CONC_ASPH - бетон и асфальт
-- CONC_GRS - бетон и трава
-- GRASS - трава с дерном или голой землей
-- SAND - песок
-- WATER - вода
-- BITUM - битумная смола (Bituminous tar) или асфальт и/или масло или смесь битума с песком, замешанные на месте поверхности (часто относимые к "цементу земли" .Чтобы приготовить битумную смолу или асфальт нужно раскопать поверхность, смешать материал с битумным или масляным связующим веществом и покрыть поверхность получившейся смесью. Битум - это смола, полученная из масла или асфальта, который получен из масла.
-- BRICK - кирпич
-- MACADAM - поверхность из щебня или дёгтебетона, состоящая из связанных водой раздробленных камней
-- STONE - камень
-- CORAL - кораллы
-- CLAY - глина
-- LATERITE -латерит
-- GRAVEL - гравий
-- EARTH - преимущественно земля
-- ICE - лед
-- SNOW - снег
-- MEMBRANE - защищающий слоистый материал, обычно из резины
-- METAL - металл: сталь, аллюминий
-- MATS - настил для посадки, обычно из аллюминия
-- PIERCED_STEEL - перфорированная металлическая плита
-- WOOD - дерево
-- NON_BITUM_MIX - смесь без битума
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeSurfaceCompositionType
CREATE DOMAIN CodeSurfaceCompositionBaseType AS VARCHAR(60)
CHECK (VALUE ~
       'ASPH|ASPH_GRASS|CONC|CONC_ASPH|CONC_GRS|GRASS|SAND|WATER|BITUM|BRICK|MACADAM|STONE|CORAL|CLAY|LATERITE|GRAVEL|||chr(10)||'
       'EARTH|ICE|SNOW|MEMBRANE|METAL|MATS|PIERCED_STEEL|WOOD|NON_BITUM_MIX|OTHER: [A-Z]{0,40}');
CREATE TYPE CodeSurfaceCompositionType AS (
  nilReason NilReasonEnumeration,
  value CodeSurfaceCompositionBaseType
);

-- Код указывающий на технику подотовки ВПП.
-- NATURAL - естественная поверхность, без обработки
-- ROLLED - обкатанная
-- COMPACTED - сжатая (уплотненная)
-- GRADED - выположенная
-- GROOVED - бороздчатая
-- OILED - масляная
-- PAVED - мощёная
-- PFC - пористое фрикционное покрытие
-- AFSC - спресованное уплотненное фрикционное покрытие
-- RFSC - гуммированное уплотненное фрикционное покрытие
-- NON_GROOVED - не бороздчатый асфальт
--
--https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeSurfacePreparationBaseType
CREATE DOMAIN CodeSurfacePreparationType AS VARCHAR(60)
CHECK (VALUE ~ '(NATURAL|ROLLED|COMPACTED|GRADED|GROOVED|OILED|PAVED|PFC|AFSC|RFSC|NON_GROOVED|OTHER: [A-Z]{0,30})');

-- Код обозначающий состояние поверхности, такой как ВПП, рулежная дорожка, маркировка порога и т.п.
-- GOOD - хорошее
-- FAIR - чистое (?)
-- POOR - плохое
-- UNSAFE - ненадежное
-- DEFORMED - деформированное
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeSurfaceConditionType
CREATE DOMAIN CodeSurfaceConditionType AS VARCHAR(60)
CHECK (VALUE ~ '(GOOD|FAIR|POOR|UNSAFE|DEFORMED|OTHER: [A-Z]{0,30})');

-- Классификационное число покрытия - параметр выражающий несущую способность (грузонапряжённость)
-- покрытия ВПП аэродрома для эксплуатации без ограничений, используемый совместно с классификационным числом воздушного судна.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValPCNType
CREATE DOMAIN ValPCNType AS DECIMAL(4, 1);

-- Код, обозначающий упругие свойства покрытия (жесткое или гибкое), используемого для определения ACN.
-- RIGID - жесткое покрытие
-- FLEXIBLE - гибкое покрытие
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodePCNPavementType
CREATE DOMAIN CodePCNPavementType AS VARCHAR(60)
CHECK (VALUE ~ '(RIGID|FLEXIBLE|OTHER: [A-Z]{0,30})');

-- Код, указывающий на класс прочности покрытия, связанный с PCN числа.
-- A - поверхность высокой прочности
-- B - поверхность средней прочности
-- C - поверхность низкой прочности
-- D - поверхность  низкой прочности
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodePCNSubgradeType
CREATE DOMAIN CodePCNSubgradeType AS VARCHAR(60)
CHECK (VALUE ~ '(A|B|C|D|OTHER: [A-Z]{0,30})');

-- Код, указывающий максимально допустимое давление в шинах, относящуюся. Используется в PCN.
-- W - высокий: нет ограничений давления (pressure)
-- X - средний: давление до 1.5 МПа (217 psi)
-- Y - низкий: давление до 1.0 МПа (145 psi)
-- Z - очень низкий: давление до 0.5 МПа (73 psi)
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodePCNTyrePressureType
CREATE DOMAIN CodePCNTyrePressureType AS VARCHAR(60)
CHECK (VALUE ~ '(W|X|Y|Z|OTHER: [A-Z]{0,30})');

-- Код, указывающий на метод, используемый при оценке PCN.
-- TECH - техническая оценка
-- ACFT - основанная на опыте воздушного судна
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodePCNMethodBaseType
CREATE DOMAIN CodePCNMethodType AS VARCHAR(60)
CHECK (VALUE ~ '(TECH|ACFT|OTHER: [A-Z]{0,30})');

-- The value of a load classification number (LCN) for a surface.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValLCNBaseType
CREATE DOMAIN ValLCNType AS DECIMAL;

-- Единицы измерения веса.
-- T - тонны
-- LB - фунты
-- TON - не метрические американские тонны (2000 ob или 907.18474 кг)
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_UomWeightType
CREATE DOMAIN UomWeightType AS VARCHAR(60)
CHECK (VALUE ~ '(KG|T|LB|TON|OTHER: [A-Z]{0,30})');

-- Значение веса.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_UomWeightType
CREATE DOMAIN ValWeightBaseType AS DECIMAL
CHECK (VALUE > 0);
CREATE TYPE ValWeightType AS (
  value ValWeightBaseType,
  unit  UomWeightType
);

-- Единицы измерения давления.
-- PSI - Фунт на квадратный дюйм
-- BAR - 100000 Па
-- TORR - Миллиметр ртутного столба
-- ATM - Физическая атмосфера
-- HPA - гектопаскали
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_UomPressureType
CREATE DOMAIN UomPressureType AS VARCHAR(60)
CHECK (VALUE ~ '(PA|MPA|PSI|BAR|TORR|ATM|HPA|OTHER: [A-Z]{0,30})');

-- Значение давления.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValPressureType
CREATE TYPE ValPressureType AS (
  value DECIMAL,
  unit  UomPressureType);

-- Код, описывающий положение по отношению к оси ВВП. Например: слева / справа от осевой линии ВПП.
-- LEFT - на левой стороне оси
-- RIGHT - на правой стороне оси
-- BOTH - распределено по двум сторонам оси
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeSideType
CREATE DOMAIN CodeSideType AS VARCHAR(40)
CHECK (VALUE ~ '((LEFT|RIGHT|BOTH|EITHER)|OTHER: [A-Z]{30})');

-- Код, указывающий на позицию элемента на поверхности взлетно-посадочной полосы.
-- TDZ - зона приземления
-- AIM - точка назначения
-- CL - осевая линия
-- EDGE - край
-- THR - начало
-- DESIG - обозначение ВПП
-- AFT_THR - после начала (фиксированное метками расстояние)
-- DTHR - перемещённое начало
-- END - конец ВПП
-- TWY_INT - пересечение рулежных дорожек
-- RPD_TWY_INT - частое (или резкое) пересечение рулежных дорожек
-- 1_THIRD - первая треть ВПП, считая от начала с наименьшим номером определителя (designation number)
-- 2_THIRD - вторая треть ВПП, считая от начала с наименьшим номером определителя
-- 3_THIRD - последняя треть ВПП, считая от начала с наименьшим номером определителя
--
--https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRunwaySectionBaseType
CREATE DOMAIN CodeRunwaySectionType AS VARCHAR(40)
CHECK (VALUE ~
       '((TDZ|AIM|CL|EDGE|THR|DESIG|AFT_THR|DTHR|END|TWY_INT|RPD_TWY_INT|1_THIRD|2_THIRD|3_THIRD)|OTHER: [A-Z]{0,30})');

-- Значение индикатора направления (в данной точке), измереннное как угол между данным направлением и направлением на истинный северный или магнитный полюс (может задаваться явно и неянво).
-- Угол измеряется по часовой стрелке от 0 до 360 градусов. Значение может быть радиалом всенаправленного азимутального радиомаяка (РМА, VHF). Например, направление на запад выражается как 270 градусов.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValBearingType
CREATE DOMAIN ValBearingType AS DECIMAL
CHECK ( VALUE >= 0 AND VALUE <= 360);

-- Идентификатор направления поворота
-- LEFT - налево
-- RIGHT - направо
-- EITHER	- любое левое или правое направление
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeDirectionTurnType
CREATE DOMAIN CodeDirectionTurnType AS VARCHAR(40)
CHECK (VALUE ~ '((LEFT|RIGHT|EITHER)|OTHER: [A-Z]{0,30})');

-- Значение наклона или градиента восхождения/спуска, выраженное в процентах
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValSlopeType
CREATE DOMAIN ValSlopeType AS DECIMAL
CHECK ( VALUE >= -100 AND VALUE <= 100);

-- Код маркировки ВПП, связанный с посадочными категориями, такими как точность, не точность и базовые категории.
-- PRECISION - маркировка соответствует заходу на посадку с точностью: используется и поперечная информация (локализатор), и вертикальная (наклон глиссады).
-- Маркировка захода на посадку с точностью включает маркировку для обозначения ВПП (Runway Designation), для геометрической оси, начала, пункта назначения, зоны посадки, боковых полос
-- NONPRECISION - маркировка соответствует заходу на посадку без точности: используется только поперечная информация (боковая)
-- Маркировка захода на посадку без точности включает маркировку для обозначения ВПП (Runway Designation), для геометрической оси, начала и пункта назначения
-- BASIC - базовые или визуальные элементы маркировки ВПП включают маркировки для обозначения ВПП (Runway Designation), для геометрической оси, начала (на ВПП, которые намереваются использовать международные торговые самолеты) и пункта назначения (на ВПП в 4000 футов (1200 метров) или длиннее, используемых реактивными самолетами)
-- NONE - у ВПП нет маркировки
-- RUNWAY_NUMBERS - единственный элемент маркировки ВПП - обозначение ВПП (Runway Designation)
-- NON_STANDARD - такие элементы маркировк, как обозначение ВПП, геометрическая ось, начало и пункт назначения могут быть представлены, но они не являются стандартной маркировкой
-- HELIPORT - специфичная маркировка для вертолетов
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRunwayMarkingType
CREATE DOMAIN CodeRunwayMarkingType AS VARCHAR(40)
CHECK (VALUE ~ '((PRECISION|NONPRECISION|BASIC|NONE|RUNWAY_NUMBERS|NON_STANDARD|HELIPORT)|OTHER: [A-Z]{0,30})');

-- Список значений, идентифицирующих состояние нарисованных поверхностных элементов маркировки
-- GOOD - маркировка в хорошем состоянии
-- FAIR - маркировка в порядочном состоянии
-- POOR - маркировка в плохом состоянии
-- EXCELLENT - маркировка в прекрасном состоянии
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeMarkingConditionType
CREATE DOMAIN CodeMarkingConditionType AS VARCHAR(40)
CHECK (VALUE ~ '((GOOD|FAIR|POOR|EXCELLENT)|OTHER: [A-Z]{0,30})');

-- ДЛЯ rw
CREATE DOMAIN CodeStatusServiceType AS VARCHAR(40)
CHECK (VALUE ~ '((nilReason|NORMAL|LIMITED|ONTEST|UNSERVICEABLE|OTHER)|OTHER: [A-Z]{0,30})');

-- Классификация посадочной световой системы, с использованием в качестве критерия "JAR-OPS 1 - Subpart E, Appendix 1 to 1.430"
-- FALS - полное световое оборудование, включая маркировки ВПП, высокая/средняя интенсивность посадочной световой системы - 720 м и более, огни по краям ВПП, в начале ВПП и в конце ВПП
-- IALS - среднее световое оборудование, включая маркировки ВПП, высокая/средняя интенсивность посадочной световой системы - от 420 до 720 м, огни по краям ВПП, в начале ВПП и в конце ВПП
-- BALS - базовое световое оборудование, включая маркировки ВПП, высокая/средняя интенсивность посадочной световой системы - менее 420 м (или низкая интенсивность посадочной световой системы любой длины), огни по краям ВПП, в начале ВПП и в конце ВПП
-- NALS - световое оборудование отсутствует или не эффективно, включая маркировки ВПП, огни по краям ВПП, в начале ВПП и в конце ВПП или отсутствие светового оборудования вообще
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeLightingJARType
CREATE DOMAIN CodeLightingJARBaseType AS VARCHAR(40) CHECK (VALUE ~ '((FALS|IALS|BALS|NALS)|OTHER: [A-Z]{0,30})');
CREATE TYPE CodeLightingJARType AS (
  nilReason NilReasonEnumeration,
  value CodeLightingJARBaseType
);
CREATE DOMAIN CodeSpecialNavigationSystemBaseTypeBaseType AS VARCHAR(40) CHECK (VALUE ~ '(LORANA|LORANC|LORAND|DECCA|GNSS|OTHER)'::text);

CREATE TYPE CodeSpecialNavigationSystemType AS (
  nilReason NilReasonEnumeration,
  value CodeSpecialNavigationSystemBaseTypeBaseType
);

-- Уровень, для которого навигационные средства предоставляют точное руководство захода на посадку
-- NON_PRECISION - ВПП с заходом на посадку без точности: используется только поперечная информация (боковая)
-- ILS_PRECISION_CAT_I - ВПП с заходом на посадку с точностью: категория I
-- ILS_PRECISION_CAT_II - ВПП с заходом на посадку с точностью: категория II
-- ILS_PRECISION_CAT_IIIA - ВПП с заходом на посадку с точностью: категория III A
-- ILS_PRECISION_CAT_IIIB - ВПП с заходом на посадку с точностью: категория III B
-- ILS_PRECISION_CAT_IIIC - ВПП с заходом на посадку с точностью: категория III C
-- ILS_PRECISION_CAT_IIID - ВПП с заходом на посадку с точностью: категория III D
-- MLS_PRECISION - микроволновая точностная система захода на посадки
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeApproachGuidanceType
CREATE DOMAIN CodeApproachGuidanceType AS VARCHAR(40)
CHECK (VALUE ~
       '((NON_PRECISION|ILS_PRECISION_CAT_I|ILS_PRECISION_CAT_II|ILS_PRECISION_CAT_IIIA|ILS_PRECISION_CAT_IIIB|||chr(10)||'
       'ILS_PRECISION_CAT_IIIC|ILS_PRECISION_CAT_IIID|MLS_PRECISION)|OTHER: [A-Z]{0,30})');

-- Код, идентифицирующий уровень интенсивности источника света
-- LIL - низкая интенсивность света
-- LIM - средняя интенсивность света
-- LIH - высокая интенсивность света
-- LIL_LIH - низкая интенсивность для ночного использования, высокая интенсивность для дневного использования, определяется фотоэлементом
-- PREDETERMINED - заранее заданный шаг интенсивности, в посадочной системе освещения, которая для радио контроля воздух-земля превосходит по важности систему освещения ВПП, которая установлена, основываясь на условиях видимости.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeLightIntensityType
CREATE DOMAIN CodeLightIntensityType AS VARCHAR(40)
CHECK (VALUE ~ '((LIL|LIM|LIH|LIL_LIH|PREDETERMINED)|OTHER: [A-Z]{0,30})');

-- Код, обозначающий цвет. Список допустимых значений включает названные цвета, а не цвета, которые описываются только с использованием RGB или CMYK или какой-либо другой системой цветов.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeColourType
CREATE DOMAIN CodeColourType AS VARCHAR(40)
CHECK (VALUE ~
       '((YELLOW|RED|WHITE|BLUE|GREEN|PURPLE|ORANGE|AMBER|BLACK|BROWN|GREY|LIGHT_GREY|MAGENTA|PINK|VIOLET)|OTHER: [A-Z]{30})');

-- Codelist containing the Telecom Networks that can be used to address an organisation.
-- AFTN - The data interchange in the AFS is performed by the Aeronautical Fixed Telecommunications Network, AFTN. This is a message handling network running according to ICAO Standards documented in Annex 10 to the ICAO Convention
-- AMHS - Aeronautical Message Handling System. A standard for aeronautical ground-ground communications (e.g. for the transmission of NOTAM, Flight Plans or Meteorological Data) based on X.400 profiles. It has been defined by the International Civil Aviation Organization (ICAO)
-- INTERNET - The Internet is a worldwide, publicly accessible series of interconnected computer networks that transmit data by packet switching using the standard Internet Protocol (IP)
-- SITA - SITA network
-- ACARS - Aircraft Communications Addressing and Reporting System. A datalink system that enables ground stations (airports, aircraft maintenance bases, etc.) and commercial aircraft to communicate without voice using a datalink system.
-- ADNS - ARINC Data Network Service (retired Mar 2007)
-- RESURFACING - работы по асфальтированию
--
--https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeTelecomNetworkType
CREATE DOMAIN CodeTelecomNetworkType AS VARCHAR(40)
CHECK (VALUE ~ '((AFTN|AMHS|INTERNET|SITA|ACARS|ADNS)|OTHER: [A-Z]{30})');

-- A phone or facsimile number.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_TextPhoneBaseType
CREATE DOMAIN TextPhoneType AS VARCHAR
CHECK (VALUE ~ '(\+)?[0-9\s\-\(\)]+');

-- Список значений, идентифицирующих цель полета в зависимости от расположения, таких как прибытие, вылет, перелет
-- ARR - прибытие
-- DEP - вылет
-- OVERFLY - перелет
-- ALL - все типы
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeFlightDestinationType
CREATE DOMAIN CodeFlightDestinationType AS VARCHAR(40)
CHECK (VALUE ~ '((ARR|DEP|OVERFLY|ALL)|OTHER: [A-Z]{30})');

-- Список очередности обслуживания внутри последовательности анологичных видов обслуживания: первичная, вторичная, альтернативная
-- PRIMARY - основной
-- SECONDARY - вторичный
-- ALTERNATE - альтернативный
-- EMERG - аварийная
-- GUARD - защитная
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeFacilityRankingType
CREATE DOMAIN CodeFacilityRankingType AS VARCHAR(40)
CHECK (VALUE ~ '((PRIMARY|SECONDARY|ALTERNATE|EMERG|GUARD)|OTHER: [A-Z]{30})');

/*
Список значений, используемых для определения сервиса по плнированию полетов и регулированию потоков
FPL - служба, предоставляющая одобрение и распределение планирования полетов, относящееся к ATC Unites (к объединениям Контроля Воздушного Движения -?)
FPLV - служба, предоставляющая утверждение планирования полетов
ATFM - служба управления воздушными потоками
CLEARANCE - служба, предоставляющая разрешения (вход, посадка, перелет, выход и т.д.) в данной точке
SCHED - служба, составляющая расписание и распределение временных интервалов

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeServiceATFMType
*/
CREATE DOMAIN CodeServiceATFMType AS VARCHAR(40)
CHECK (VALUE ~ '((FPL|FPLV|ATFM|CLEARANCE|SCHED)|OTHER: [A-Z]{30})');

/*
Список значений, используемых для определения сервиса по предоставлению информации
AFIS - аэродромная служба полетной информации
AIS - служба авиационной информации, как дано в ICAO Annex 15
ATIS - автоматическое информационное аэродромное обслуживание, работает на указанной частоте радиосредства
BRIEFING - служба предполетная и послеполетной информации
FIS - полетно-информационное обслуживание пролетающих самолетов
OFIS_VHF - VHF operational flight information service (OFIS) broadcasts, как дано в ICAO Annex 11
OFIS_HF - HF operational flight information service (OFIS) broadcasts, как дано в ICAO Annex 11
NOTAM - обеспечение службой NOTAM, как дано в ICAO Annex 11
INFO - предоставление ограниченной специальной информакии о специфичной активности в определенном месте
RAF - служба регионального прогноза
METAR - регулярный авиационный отчет по погоде
SIGMET - информация, издаваемая службой метеоролического наблюдения, касающаяся появления или ожидаемого появлени указанного проходящего погодного явления, котрое может повлиять на безопасность операций воздушного судна
TWEB - служба вещания записей о погоде
TAF - служба метеорологического прогноза в области терминала
VOLMET - служба передачи метеорологической информации для воздушного судна в полете
ALTIMETER - служба предоставления информации настроек альтиметра
ASOS - автоматизированная служба обследования поверхности
AWOS - автоматизированная cистема метеонаблюдений

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeServiceInformationType
*/
CREATE DOMAIN CodeServiceInformationType AS VARCHAR(40)
CHECK (VALUE ~
       '((AFIS|AIS|ATIS|BRIEFING|FIS|OFIS_VHF|OFIS_HF|NOTAM|INFO|RAF|METAR|SIGMET|TWEB|TAF|VOLMET|ALTIMETER|ASOS|AWOS)|OTHER: [A-Z]{3,30})');

/*
Список значений, используемых для определения сервиса по поиску и спасению
ALRS - служба предупреждения
SAR - служба поиска и спасения
RCC - служба по координации спасательных операций

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeServiceSARType
*/
CREATE DOMAIN CodeServiceSARType AS VARCHAR(40)
CHECK (VALUE ~ '((ALRS|SAR|RCC)|OTHER: [A-Z]{30})');

/*
Список значений, идентифицирующих тип воздушного пространства
NAS - национальная система воздушного пространства.
   [Замечание: воздушное пространство, внутри которого государство предоставляет службу управления воздушным движением обычно состоит из:
   1)территории, подвластнные государству; 2)отдельные участки воздушного пространства над открытым морем или воздушное пространство территорий без государственности, где служба управления воздушным движением предоставляется так, как определено в региональных соглашениях]
FIR - район полетной информации. Воздушное пространоство определенных размеров, внутри которого предоставляется служба полётной информации и аварийная служба оповещения.
   Описание: признается ИКАО. Может использоваться, например, если служба предоставляется более, чем одним отделом (единицей-?).
FIR_P - часть РПИ
UIR - верхний район полетной информации. Верхнее воздушное пространство определенных размеров, внутри которого предоставляется служба полётной информации и аварийная служба оповещения.
   Описание: не признается ИКАО. Каждая структура (штат) даёт своё определение верхнему воздушному пространству.
UIR_P - часть верхнего РПИ
CTA - диспетчерская зона (или зона управления). Управляемое воздушное пространство, распространяющееся вверх от определенной границы над землей.
   Описание: признается ИКАО.
CTA_P - часть диспетчерской зоны
OCA - океаническая диспетчерская зона. Диспетчерская зона, распространяющаяся вверх в верхнем воздушном пространстве.
   Описание: не признается ИКАО.
OCA_P - часть океанической диспетчерской зоны
UTA - верхняя диспетчерская зона. Диспетчерская зона, распространяющаяся вверх в верхнем воздушном пространстве.
   Описание: не признается ИКАО.
UTA_P - часть верхней диспетчерской зоны
TMA - диспетчерская зона у аэропортов. Диспетчерская зона, обычно установленная в месте скопления путей служб управления воздушным движением в окрестностях одного или более значительных аэродромов.
   Описание: не признается ИКАО. В основном используется в Европе под гибким использованием концепта воздушного пространства (??)
TMA_P - часть диспетчерской зоны у аэропортов
CTR - диспетчерский район. Управляемое воздушное пространство, распространяющееся вверх от поверхности земли до определенной верхней границы.
   Описание: признается ИКАО.
CTR_P - часть диспетчерского района
OTA - океаническая транзитная зона
SECTOR - диспетчерский сектор. Разделение обозначенной диспетчерской зоны, внутри которой ответственность отведена одному диспетчеру или небольшой группе диспетчеров.
   Описание: признается ИКАО.
SECTOR_C - временно сгруппированный сектор
TSA - временно отделенная зона (FUA). Воздушное пространство с заранее определенными размерами, внутри которого действия требуют бронирования воздушного пространства для исключительного пользования определенными пользователями в течение предопределенного периода времени.
   Описание: площадь, на которой приняты специальные ограничительные меры, направленные на предотвращение или минимизацию вмешательства (помех) со стороны дружественных сил.
             площадь под военным контролем, на которой приняты специальные меры безопасности, чтобы предотвратить несанкционированное вторжение.
CBA - зарубежная зона (FUA). Воздушное пространство определенных размеров над контактными площадями земли или внутренними водами более чем одного государства.
   Описание: не признается ИКАО. В основном используется в Европе под гибким использованием концепта воздушного пространства (??)
RCA - сокращенная зона координации (FUA). Часть воздушного пространства определенных размеров, внутри которого общее воздушное движение разрешено по принципу "off-route", когда нет необходимости диспетчерам общего воздушного движения начинать коодинацию с диспетчерами OAT.
   Описание: не признается ИКАО.  В основном используется в Европе под гибким использованием концепта воздушного пространства (??)
RAS - регулируемое воздушное пространство (ничем другим не покрытое).
AWY - воздушный путь (корридор). Управляемая территория или ее часть, установленная в форме корридора.
MTR - буферная зона военного тренировочного пути. Управляемая территория или ее часть, установленная в форме корридора вокруг военного тренировочного пути в целях оградить его от другого движения (воздушного).
P - запрещенная зона. Воздушное пространство определенных размеров над землей или внутренними водами государства, внутри которого полеты воздушным суднам запрещены.
   Описание: признается ИКАО.
R - зона ограничения полетов. Воздушное пространство определенных размеров над землей или внутренними водами государства, внутри которого полеты воздушных суден ограничены в соответствии с определенными обозначенными условиями.
   Описание: признается ИКАО.
D - опасная зона. Воздушное пространство определенных размеров, внутри которого в определенное время могут существовать условия, опасные для полета воздушного судна.
   Описание: признается ИКАО.
ADIZ - воздушная защитная идентификационная зона. Специально названное воздушное пространство определенных размеров, внутри которого воздушное судно должно исполнять специальные процедуры идентификации и/или отчетности вдобавок к процедурам, связанным с обеспечением служб управления воздушным движением.
   Описание: признается ИКАО.
NO_FIR - воздушная зона, для которой не определен даже РПИ.
   [Замечание: есть части земного пространства, где не определен ни РПИ, ни любой другой тип воздушного пространства. Такое воздушное пространство обозначается: NO-FIR]
PART - часть воздушного пространства (используется в аггрегациях воздушного пространства)
CLASS - воздушное пространство, имеющее определённый класс
POLITICAL - политическая/административная зона
D_OTHER - действия опасного происхождения (не то же, что опасная зона)
TRA - временнно зарезервированная зона.  Воздушное пространство с заранее определенными размерами, внутри которого действия требуют бронирования воздушного пространства в течение предопределенного периода времени.
   Описание: не признается ИКАО. В основном используется в Европе под гибким использованием концепта воздушного пространства (??)
A - зона тревоги. Воздушное пространство, на котором может произоводиться большой объем действий по обучению пилотов или не обычные типы воздушных действий, не опасные для воздушного судна.
   Описание: не признается ИКАО. В основном используется в США и прилигающих территориях.
W - зона предупреждения. Не управляемое воздушное пространство определенных размеров
PROTECT - воздушное пространство, защищенное от необычного воздушного движения
AMA - зона минимальной высоты. Минимальная высота, используемая согласно с метеоусловиями полета по приборам и обеспечивающая минимальный вертикальный промежуток в 300 метров (1000 футов) или в случае обозначенной горной местности - 600 метров (2000 футов) наад всеми препятствиями, расположенными над данной территорией.
   Описание: признается ИКАО. Издается многими штатми как прямоугольник 1*1 градус в ENR 6 charts (?).
   Замечание: при точном расчете 984 фута может использоватьсся как эквивалент 300 метров.
ASR - зона установки альтиметра. Воздушное пространство определенных размеров, внутри которого производят процедуры по стандартизированной установке альтиметра.
   Описание: не признается ИКАО. Например, в течение полета альтиметр должен быть настроен по местным установкам альтиметра ближайшей станции по ходу полета.
ADV - рекомендованная зона. Зона определенных размеров, внутри которой доступна консультативная служба воздушного движения.
   Описание: признается ИКАО. Диспетчерская служба воздушного движения предоставляет куда более полный набор услуг, чем консультативная служба воздушного движения, поэтому консультативные зоны полётов и путей не устанавливают внутри воздушных пространств, управляемых диспетчерами, но консультативная служба воздушного сообщения может предоставляться и внизу, и наверху.
UADV - верхняя рекомендованная зона. Зона определенных размеров в верхнем воздушном пространстве, внутри которой доступна консультативная служба воздушного движения.
   Описание: признается ИКАО. Диспетчерская служба воздушного движения предоставляет куда более полный набор услуг, чем консультативная служба воздушного движения, поэтому консультативные зоны полётов и путей не устанавливают внутри воздушных пространств, управляемых диспетчерами, но консультативная служба воздушного сообщения может предоставляться и внизу, и наверху.
ATZ - зона движения аэропорта. Воздушное пространство определенных размеров, установленное вокруг аэропорта для защиты движения в аэропорту.
   Описание: признается ИКАО.
ATZ_P - часть зоны движения аэропорта
HTZ	- зона движения вертодрома
NAS_P - часть национальной системы воздушного пространства

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAirspaceType
*/
CREATE DOMAIN CodeAirspaceType AS VARCHAR(40)
CHECK (VALUE ~
       '((NAS|FIR|FIR_P|UIR|UIR_P|CTA|CTA_P|OCA|OCA_P|UTA|UTA_P|TMA|TMA_P|CTR|CTR_P|OTA|SECTOR|SECTOR_C|TSA|CBA|||chr(10)||'
       'RCA|RAS|AWY|MTR|P|R|D|ADIZ|NO_FIR|PART|CLASS|POLITICAL|D_OTHER|TRA|A|W|PROTECT|AMA|ASR|ADV|UADV|ATZ|ATZ_P|HTZ|NAS_P)|OTHER: [A-Z]{30})');

/*
Допустимый тип воздушного пространства

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAirspaceDesignatorType
*/
CREATE DOMAIN CodeAirspaceDesignatorType AS VARCHAR(20)
CHECK (VALUE ~ '([A-Z]|[0-9]|[, !"&#$%''\(\)\*\+\-\./:;<=>\?@\[\\\]\^_\|\{\}])*');

/*
A - класс воздушного пространства по ICAO Annex 11. Appendix 4. Разрешены только полёты по правилам полётов по приборам (ППП); все полёты снабжены диспетчерской службой воздушного движения и отделены друг от друга.
B - класс воздушного пространства по ICAO Annex 11. Appendix 4. Разрешены полёты по ППП и полёты по правилам визуального полёта (ПВП); все полёты снабжены диспетчерской службой воздушного движения и отделены друг от друга.
C - класс воздушного пространства по ICAO Annex 11. Appendix 4. Разрешены полёты по ППП и полеты по ПВП; все полёты снабжены диспетчерской службой воздушного движения, полёты по ППП отделены от других полетов по ППП и от полетов по ПВП. Полеты по ПВП отделены от полетов по ППП и получают информацию о движении.
D - класс воздушного пространства по ICAO Annex 11. Appendix 4. Разрешены полёты по ППП и полеты по ПВП; все полёты снабжены диспетчерской службой воздушного движения, полёты по ППП отделены от других полетов по ППП и получают информацию о движении, касающуюся полетов по ПВП. Полеты по ПВП получают информацию о движении, касающуюся всех других полетов.
E - класс воздушного пространства по ICAO Annex 11. Appendix 4. Разрешены полёты по ППП и полеты по ПВП; полёты по ППП снабжены диспетчерской службой воздушного движения и отделены от других полетов по ППП. Все полеты получают информацию о движении настолько, насколько это осуществимо. Класс Е не должен быть использован в диспетчерских зонах.
F - класс воздушного пространства по ICAO Annex 11. Appendix 4. Разрешены полёты по ППП и полеты по ПВП; все участвующие полёты по ППП снабжены консультативной службой воздушного движения, все полёты получают услуги по летной информации по требованию. Описание: приведение в исполнение консультативная служба воздушного движения обычно считается временной мерой, только до того времени, когда эта служба может быть заменена авиадиспетчерской службой.
G - класс воздушного пространства по ICAO Annex 11. Appendix 4. Разрешены полёты по ППП и полеты по ПВП и получают службу полетной информации по требованию.

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAirspaceClassificationType
*/
CREATE DOMAIN CodeAirspaceClassificationType AS VARCHAR(40)
CHECK (VALUE ~ '((A|B|C|D|E|F|G)|OTHER: [A-Z]{30})');

/*
SFC - расстояние, измеренное от поверхности Земли (эквивалентно AGL - над уровнем Земли)
MSL - расстояние, измеренное от среднего уровня моря (эквивалентно высоте)
W84 - расстояние, измеренное от эллипсоида WGS84
STD - вертикальное расстояние, измеренное с помощью альтиметра, установленного по стандартной атмосфере
*/
CREATE DOMAIN CodeVerticalReferenceType AS VARCHAR(40)
CHECK (VALUE ~ '((SFC|MSL|W84|STD)|OTHER: [A-Z]{30})');

/*
ABOVE_LOWER - на нижней высоте или выше нее
BELOW_UPPER - на верхней высоте или ниже нее
AT_LOWER - на нижней высоте
BETWEEN - между верхней и нижней высотами
RECOMMENDED - рекомендована нижняя высота
EXPECT_LOWER - ожидать нижнюю высоту от службы управлением воздушным движением
AS_ASSIGNED - назначается во время операций (например, службой управления воздушным движением)

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAltitudeUseType
*/
CREATE DOMAIN CodeAltitudeUseType AS VARCHAR(40)
CHECK (VALUE ~ '((ABOVE_LOWER|BELOW_UPPER|AT_LOWER|BETWEEN|RECOMMENDED|EXPECT_LOWER|AS_ASSIGNED)|OTHER: [A-Z]{30})');

/*
Префикс перед основной буквой воздушных трасс (ИКАО).
K - Kopter - маршрут расположен в нижнем воздушном пространстве и предназначен, в основном, для полетов вертолетов
U - Upper - маршрут расположен в верхнем воздушном пространстве
S - Supersonic - маршрут предназначен для самолетов со сверхзвуковыми скоростями полета
T - TACAN Route (военный)

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRouteDesignatorPrefixType
*/
CREATE DOMAIN CodeRouteDesignatorPrefixType AS VARCHAR(40)
CHECK (VALUE ~ '((K|U|S|T)|OTHER: [A-Z]{30})');

/*
Однобуквенный указатель для пути

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRouteDesignatorLetterType
*/
CREATE DOMAIN CodeRouteDesignatorLetterType AS VARCHAR(40)
CHECK (VALUE ~ '((A|B|G|H|J|L|M|N|P|Q|R|T|V|W|Y|Z)|OTHER: [A-Z]{30})');

/*
A (positive) number of similar items.

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_NoNumberType
*/
CREATE DOMAIN NoNumberType AS INTEGER;

/*
Буквы латинского алфавита

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeUpperAlphaType
*/
CREATE DOMAIN CodeUpperAlphaType AS VARCHAR(40)
CHECK (VALUE ~ '((A|B|C|D|E|F|G|H|I|J|K|L|M|N|O|P|Q|R|S|T|U|V|W|X|Y|Z)|OTHER: [A-Z]{0,30})');

-- Классификация путей на пути ATS и северно-атлантические пути.
-- ATS - участки, используемые с разрешения службы движения при повышенном внимании (путь ATS описан в ICAO Annex 11).
-- NAT - маршрут выхода на северо - атлантический трек (часть организовнной системы путей)
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRouteType
CREATE DOMAIN CodeRouteType AS VARCHAR(40)
CHECK (VALUE ~ '((ATS|NAT)|OTHER: [A-Z]{0,30})');

-- Правила полета, которые должны соблюдаится воздушным судном.
-- IFR
-- VFR
-- ALL - IFR и VFR
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeFlightRuleType
CREATE DOMAIN CodeFlightRuleType AS VARCHAR(40)
CHECK (VALUE ~ '((IFR|VFR|ALL)|OTHER: [A-Z]{0,30})');

-- Код, обозначающий, является путь международным или региональным (местным)
-- INTL - международный
-- DOM - местные воздушные линии
-- BOTH - и то, и другое
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRouteOriginType
CREATE DOMAIN CodeRouteOriginType AS VARCHAR(40)
CHECK (VALUE ~ '((INTL|DOM|BOTH)|OTHER: [A-Z]{0,30})');

-- Код, разделяющий военный и гражданский типы
-- MIL - военный
-- CIVIL - гражданский
-- ALL - и военный, и гражданский
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeMilitaryStatusType
CREATE DOMAIN CodeMilitaryStatusType AS VARCHAR(40)
CHECK (VALUE ~ '((MIL|CIVIL|ALL)|OTHER: [A-Z]{0,30})');

-- Код, обозначающий тип полета на военном тренировочном пути
-- IR - тренировочный путь IFR
-- VR - тренировочный путь VFR
-- SR - тренировочный путь малой скорости и низкой высоты
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeMilitaryTrainingType
CREATE DOMAIN CodeMilitaryTrainingType AS VARCHAR(40)
CHECK (VALUE ~ '(IR|VR|SR|OTHER: [A-Z]{0,30})');

-- Код, обозначающий первичную активность, имеющую место на воздушном пространстве или причину ее появления
-- AD_TFC
-- HELI_TFC
-- TRAINING
-- AEROBATICS
-- AIRSHOW
-- SPORT
-- ULM
-- GLIDING
-- PARAGLIDER
-- HANGGLIDING
-- PARACHUTE
-- AIR_DROP
-- BALLOON
-- RADIOSONDE
-- SPACE_FLIGHT
-- и т.д.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAirspaceActivityType
CREATE DOMAIN CodeAirspaceActivityType AS VARCHAR(40)
CHECK (VALUE ~
       '(AD_TFC|HELI_TFC|TRAINING|AEROBATICS|AIRSHOW|SPORT|ULM|GLIDING|PARAGLIDER|HANGGLIDING|PARACHUTE|AIR_DROP|||chr(10)||'
       'BALLOON|RADIOSONDE|SPACE_FLIGHT|UAV|AERIAL_WORK|CROP_DUSTING|FIRE_FIGHTING|MILOPS|REFUEL|JET_CLIMBING|||chr(10)||'
       'EXERCISE|TOWING|NAVAL_EXER|MISSILES|AIR_GUN|ARTILLERY|SHOOTING|BLASTING|WATER_BLASTING|ANTI_HAIL|BIRD|||chr(10)||'
       'BIRD_MIGRATION|FIREWORK|HI_RADIO|HI_LIGHT|LASER|NATURE|FAUNA|NO_NOISE|ACCIDENT|POPULATION|VIP|VIP_PRES|||chr(10)||'
       'VIP_VICE|OIL|GAS|REFINERY|CHEMICAL|NUCLEAR|TECHNICAL|ATS|PROCEDURE|OTHER: [A-Z]{0,30})');

-- Список значений, показывающий состояние активизации воздушного пространства.
-- AVBL_FOR_ACTIVATION - свойство может быть активировано
-- ACTIVE - воздушное пространство активно (но оно еще может быть не использовано)
-- IN_USE - воздушное пространство используется в период активизации
-- INACTIVE - воздушное пространство не активно
-- INTERMITTENT - воздушное пространство активно, но имеются периоды когда оно реально не используется
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeStatusAirspaceType
CREATE DOMAIN CodeStatusAirspaceType AS VARCHAR(40)
CHECK (VALUE ~ '(AVBL_FOR_ACTIVATION|ACTIVE|IN_USE|INACTIVE|INTERMITTENT|OTHER: [A-Z]{0,30})');

-- Код, указывающий на тип связи между значимой точкой и воздушным пространством.
-- ENTRY - первая точка оповещения, отнесенная к значимой точке, через которую проходит воздушное судно или предполагается, что пройдёт, при вхождении в воздушное пространство.
-- EXIT - точка выхода. Последняя точка оповещения, отнесенная к значимой точке, через которую проходит воздушное судно или предполагается, что пройдёт, при выходе из воздушного пространства.
-- ENTRY_EXIT - точка входа/выхода. Первая и последняя точка оповещения, отнесенная к значимой точке, через которую проходит воздушное судно или предполагается, что пройдёт, при вхождении в воздушное пространство или выходе из него.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAirspacePointRoleType
CREATE DOMAIN CodeAirspacePointRoleType AS VARCHAR(40)
CHECK (VALUE ~ '(ENTRY|EXIT|ENTRY_EXIT|OTHER: [A-Z]{0,30})');

-- Код, обозначающий расположение значимой точки в воздушном пространстве
-- IN - расположена внутри воздушного пространства
-- OUT - расположена внутри воздушного пространства
-- BORDER - расположена на границе воздушного пространства
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAirspacePointPositionType
CREATE DOMAIN CodeAirspacePointPositionType AS VARCHAR(40)
CHECK (VALUE ~ '(IN|OUT|BORDER|OTHER: [A-Z]{0,30})');

-- Код, обозначающий уровень
-- UPPER - верхнее воздушное пространство
-- LOWER - нижнее воздушное пространство
-- BOTH - верхнее и нижнее воздушное пространство
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeLevelType
CREATE DOMAIN CodeLevelType AS VARCHAR(40)
CHECK (VALUE ~ '(UPPER|LOWER|BOTH|OTHER: [A-Z]{0,30})');

-- Тип сегмента пути
-- GRC - окружность большого круга
-- RHL - локсодромия
-- GDS - геодезическая линия
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRouteSegmentPathType
CREATE DOMAIN CodeRouteSegmentPathType AS VARCHAR(40)
CHECK (VALUE ~ '(GRC|RHL|GDS|OTHER: [A-Z]{0,30})');

/*
Тип маршрута с навигационной точки зрения
CONV - традиционный (обычный) навигационный путь
RNAV - маршрут зональной навигации
TACAN - радионавигационная система ближнего действия "Такан"

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRouteNavigationType
*/
CREATE DOMAIN CodeRouteNavigationType AS VARCHAR(40)
CHECK (VALUE ~ '(CONV|RNAV|TACAN|OTHER: [A-Z]{0,30})');

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRNPType
CREATE DOMAIN CodeRNPType AS VARCHAR
CHECK (VALUE ~ '[0-9]{1,2}(\.[0-9]{1}){0,1}');

-- Суффикс для определителя пути
-- F - на части пути доступно только Консультативное ОВД
-- G - на части пути доступно только Летно - информационное ОВД
--
--  https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRouteDesignatorSuffixType
CREATE DOMAIN CodeRouteDesignatorSuffixType AS VARCHAR(40)
CHECK (VALUE ~ '(F|G|OTHER: [A-Z]{0,30})');

-- Тип отчета о позиции, требуемого диспетчерской службой аэродрома (ATC Unit)
-- COMPULSORY - обязательный
-- ON_REQUEST - по запросу
-- NO_REPORT - без отчета
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeATCReportingType
CREATE DOMAIN CodeATCReportingType AS VARCHAR(40)
CHECK (VALUE ~ '(COMPULSORY|ON_REQUEST|NO_REPORT|OTHER: [A-Z]{0,30})');

-- Классификация точек входа и выхода на свободные зоны полета
-- PITCH - точка свободного полета PITCH указывает на начало свободного полета
-- CATCH - точка свободного полета CATCH указывает на конец свободного полета
--
--  https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeFreeFlightType
CREATE DOMAIN CodeFreeFlightType AS VARCHAR(40)
CHECK (VALUE ~ '(PITCH|CATCH|OTHER: [A-Z]{0,30})');

-- Код, показывающий, что у точки есть особенная роль в контексте RVSM (Cокращенный минимум вертикального эшелонирования)
-- IN - точка входа RVSM
-- OUT - точка выхода RVSM
-- IN_OUT - точка входа/выхода RVSM
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRVSMPointRoleType
CREATE DOMAIN CodeRVSMPointRoleType AS VARCHAR(40)
CHECK (VALUE ~ '(IN|OUT|IN_OUT|OTHER: [A-Z]{0,30})');

-- Код, указывающий на использование точки на военном тренировочном пути.
-- S - точка входа (начала)
-- T - точка возврата
-- X - точка выхода (конца)
-- AS - запасная точка входа
-- AX - запасная точка выхода
-- ASX - запасная точка входа/выхода
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeMilitaryRoutePointType
CREATE DOMAIN CodeMilitaryRoutePointType AS VARCHAR(40)
CHECK (VALUE ~ '(S|T|X|AS|AX|ASX|OTHER: [A-Z]{0,30})');

-- Трехбуквенный код, обозначающий язык (в соответствиии с ISO 639-2)
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeLanguageType
CREATE DOMAIN CodeLanguageType AS VARCHAR(3)
CHECK (VALUE ~ '[a-z]{3}');

/*
Тип канала связи.
HF - высокочастотный голосовой радиоканал
VHF - ультракоротковолновый голосовой радиоканал с интервалами 25 КГц
VDL1
VDL2
VDL4
AMSS
ADS_B
ADS_B_VD
HFDL
VHF_833
UHF

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeCommunicationModeType
*/
CREATE DOMAIN CodeCommunicationModeType AS VARCHAR(40)
CHECK (VALUE ~ '(HF|VHF|VDL1|VDL2|VDL4|AMSS|ADS_B|ADS_B_VD|HFDL|VHF_833|UHF|OTHER: [A-Z]{0,30})');

-- HZ - Гц
-- KHZ - кГц
-- MHZ - МГц
-- GHZ - ГГц
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_UomFrequencyType
CREATE DOMAIN UomFrequencyType AS VARCHAR(40)
CHECK (VALUE ~ '(HZ|KHZ|MHZ|GHZ|OTHER: [A-Z]{0,30})');

-- Значение частоты (радио) навигационной системы
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValFrequencyType
CREATE DOMAIN ValFrequencyBaseType AS DECIMAL
CHECK (VALUE >= 0);
CREATE TYPE ValFrequencyType AS (
  value ValFrequencyBaseType,
  unit  UomFrequencyType
);

-- Код, обозначающий тип передачи, как определено в 1979 ITU World Administrative Radio Conference.
-- A2 - телеграфный, не голосовой
-- A3A
-- A3B
-- A3E
-- A3H
-- A3J
-- A3L
-- A3U
-- J3E
-- NONA1A
-- NONA2A
-- PON
-- A8W
-- A9W
-- NOX
-- G1D
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeRadioEmissionType
CREATE DOMAIN CodeRadioEmissionType AS VARCHAR(40)
CHECK (VALUE ~ '(A2|A3A|A3B|A3E|A3H|A3J|A3L|A3U|J3E|NONA1A|NONA2A|PON|A8W|A9W|NOX|G1D|OTHER: [A-Z]{0,30})');

-- Идентификатор радиоканала, по которому осуществляется связь.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeCommunicationChannelType
CREATE DOMAIN CodeCommunicationChannelType AS VARCHAR;

/*
Код - индикатор для направленности канала связи
UPLINK
DOWNLINK
BIDIRECTIONAL
UPCAST
DOWNCAST

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeCommunicationDirectionType
*/
CREATE DOMAIN CodeCommunicationDirectionType AS VARCHAR(40)
CHECK (VALUE ~ '(UPLINK|DOWNLINK|BIDIRECTIONAL|UPCAST|DOWNCAST|OTHER: [A-Z]{0,30})');

/*
Объединение, предоставляющее отдельный вид обслуживания воздушного движения (ОВД).
ACC - Районное диспетчерское обслуживание
ADSU - полуавтоматическая система наблюдения за-воздушной обстановкой (службы УВД) , система ADS-B
ADVC - консультативный центр
ALPS - пост аварийного оповещения
AOF - офис службы аэронавигационной информации
APP - диспетчерский пункт управления заходом на посадку
APP_ARR - диспетчерский пункт управления заходом на посадку (прибытие)
APP_DEP - диспетчерский пункт управления заходом на посадку (вылет)
ARO - пункт сбора информации о полете
ATCC - центр управления воздушным движением, центр УВД
ATFMU
ATMU - служба управления воздушным движением
ATSU
BOF
BS
COM
FCST
FIC
GCA - служба захода на посадку по командам с земли
MET
MWO
NOF
OAC
PAR - служба радиолокатора точного захода на посадку
RAD
RAFC
RCC
RSC
SAR - поисково-спасательная служба
SMC
SMR
SRA
SSR - служба обзорного радиолокатора вторичной радиолокации
TAR
TWR
UAC
UDF
UIC
VDF
WAFC
ARTCC
FSS
TRACON
MIL
MILOPS

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeUnitType
*/

CREATE DOMAIN CodeUnitType AS VARCHAR(40)
CHECK (VALUE ~ '((ACC|ADSU|ADVC|ALPS|AOF|APP|APP_ARR|APP_DEP|ARO|ATCC|ATFMU|ATMU|ATSU|BOF|BS|COM|FCST|FIC|GCA|||chr(10)||'
'MET|MWO|NOF|OAC|PAR|RAD|RAFC|RCC|RSC|SAR|SMC|SRA|SSR|TAR|TWR|UAC|UDF|UIC|VDF|WAFC|ARTCC|FSS|TRACON|MIL|MILOPS)|OTHER: [A-Z]{0,30})');

-- Вид зависимости между объединением и связанным с ним объединением
-- OWNER - связанное объединение (RelatedUnit) - владелец объединения (Unit)
-- PROVIDER - объединение (Unit) пользуется обслуживание связанного объединения (RelatedUnit)
-- ALTERNATE - связанное объединение (RelatedUnit) предоставляет запасное (альтернативное) обслуживание взамен обслуживания текущего объединения
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeUnitDependencyType
CREATE DOMAIN CodeUnitDependencyType AS VARCHAR(40)
CHECK (VALUE ~ '(OWNER|PROVIDER|ALTERNATE|OTHER: [A-Z]{0,30})');

/*
Классификация служб эшелонирования полетов и наземного контроля
-- ACS - служба контроля территории маршрутных полетов
-- UAC - служба контроля верхней зоны полетов
-- OACS - служба контроля океанической зоны
-- APP - служба контроля зоны посадки (зоны прибытия и вылета)
-- TWR - башенная служба контроля аэродрома
-- ADVS - консультационная служба
-- EFAS - консультационная служба маршрутных полетов
CTAF - общая консультативная частота аэродромного обслуживания (только США)

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeServiceATCType
*/
CREATE DOMAIN CodeServiceATCType AS VARCHAR(40)
CHECK (VALUE ~ '((ACS|UAC|OACS|APP|TWR|ADVS|CTAF)|OTHER: [A-Z]{0,30})');

-- Тип ответственности, которую организация нест за аэронавигационный объект (например, за воздушное пространство)
-- OWN - у организации есть законные права на владение и право собственности на объект.
-- DLGT - организации назначили или поручили нести ответственности за объект.
-- AIS - организация ответственна за предоставление аэронавишационной информации на данном объекте.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAuthorityType
CREATE DOMAIN CodeAuthorityType AS VARCHAR(40)
CHECK (VALUE ~ '(OWN|DLGT|AIS|OTHER: [A-Z]{0,30})');

/*
Типы служб навигационных средств
VOR - всенаправленное навигационное ОВЧ средство с угломерными возможностями
DME - дальномерное оборудование
NDB - ненаправленный радиомаяк
TACAN - всенаправленное навигационное средство УВЧ, позволяюшее определить пеленг и дальность
MKR - маркерный радиомаяк, МРМ
ILS - инструментальная система посадки по приборам (возможно наличие позывных на частоте курсового маяка)
ILS_DME - инструментальная система посадки по приборам с размещенной дальномерной системой DME
MLS - микроволновая система посадки
MLS_DME
VORTAC - совмещенные маяк VOR и стандартное УВЧ дальномерное обрудование системы TACAN
VOR_DME - совмещенное навигационное средство VOR и стандартное УВЧ дальномерное оборудование системы TACAN
NDB_DME
TLS
LOC - курсовой посадочный радиомаяк
LOC_DME
NDB_MKR
DF - (радио)пеленгатор
SDF - упрощенное средство направленного действия

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeNavaidServiceType
*/
CREATE DOMAIN CodeNavaidServiceType AS VARCHAR(40)
CHECK (VALUE ~
       '(VOR|DME|NDB|TACAN|MKR|ILS|ILS_DME|MLS|MLS_DME|VORTAC|VOR_DME|NDB_DME|TLS|LOC|LOC_DME|NDB_MKR|DF|OTHER: [A-Z]{0,30})');

-- Идентификатор РНС
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeNavaidDesignatorType
CREATE DOMAIN CodeNavaidDesignatorType AS VARCHAR(4)
CHECK (VALUE ~ '([A-Z]|\d)*');

-- Использование РНС:
-- TERMINAL - для использования в зоне терминала, для процедур приближения, посадки и вылета.
-- ENROUTE - маршрутные РНС
-- ALL - для любых целей
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeNavaidPurposeType
CREATE DOMAIN CodeNavaidPurposeType AS VARCHAR(40)
CHECK (VALUE ~ '(TERMINAL|ENROUTE|ALL|OTHER: [A-Z]{0,30})');

-- ...
-- I
-- II
-- III
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeSignalPerformanceILSType
CREATE DOMAIN CodeSignalPerformanceILSType AS VARCHAR(40)
CHECK (VALUE ~ '(I|II|III|OTHER: [A-Z]{0,30})');

-- A
-- B
-- C
-- D
-- E
-- T
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeCourseQualityILSType
CREATE DOMAIN CodeCourseQualityILSType AS VARCHAR(40)
CHECK (VALUE ~ '(A|B|C|D|E|T|OTHER: [A-Z]{0,30})');

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeIntegrityLevelILSType
CREATE DOMAIN CodeIntegrityLevelILSType AS VARCHAR(40)
CHECK (VALUE ~ '(1|2|3|4|OTHER: [A-Z]{0,30})');

/*
TWR - диспетчерская служба с аэродромной вышки
SMGCS - система контроля и управления движением транспорта на площади маневрирования
TAXI - служба разрешения рулежки (?)

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeServiceGroundControlType
*/
CREATE DOMAIN CodeServiceGroundControlType AS VARCHAR(40)
CHECK (VALUE ~ '((TWR|SMGCS|TAXI)|OTHER: [A-Z]{0,30})');

/*
DEICE - служба по защите от обледенения
HAND - служба обработки сообщений
HANGAR - служба укрытия (?)
REPAIR - ремонтная службы
REMOVE - вывоз непригодных воздухных суден

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeAircraftGroundServiceType
*/
CREATE DOMAIN CodeAircraftGroundServiceType AS VARCHAR(40)
CHECK (VALUE ~ '((DEICE|HAND|HANGAR|REPAIR|REMOVE)|OTHER: [A-Z]{0,30})');

/*
Код, обозначающий систему измерения времени (например, UTC)

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeTimeReferenceType
 */
CREATE DOMAIN CodeTimeReferenceType AS VARCHAR(40)
CHECK (VALUE ~
       '((UTC|UTC-12|UTC-11|UTC-10|UTC-9|UTC-8|UTC-7|UTC-6|UTC-5|UTC-4|UTC-3|UTC-2|UTC-1|UTC+1|UTC+2|UTC+3|||chr(10)||'
       'UTC+4|UTC+5|UTC+6|UTC+7|UTC+8|UTC+9|UTC+10|UTC+11|UTC+12|UTC+13|UTC+14)|OTHER: [A-Z]{0,30})');

CREATE DOMAIN DateMonthDayType AS VARCHAR(40)
CHECK (VALUE ~
       '(((0[1-9])|(1[0-9])|(2[0-9]))\-((0[1-9])|10|11|12))|(30\-(01|03|04|05|06|07|08|09|10|11|12))|(31\-(01|03|05|07|08|10|12))|SDLST|EDLST');

/*
Код, обозначающий определенный день (день недели, праздничные дни, рабочие дни и т.д.)
MON - понедельник
TUE - вторник
WED - среда
THU - четверг
FRI - пятница
SAT - суббота
SUN - воскресенье
WORK_DAY - рабочий день
BEF_WORK_DAY - день, предшествующий рабочему
AFT_WORK_DAY - день, следующий после рабочего
HOL - официальный день отдыха
BEF_HOL - день, предшествующий официальному праздничному дню
AFT_HOL - день, следующий после официального праздничного дня
ANY - любой день
BUSY_FRI - день объявленный как "занятая пятница" официальными властями, отвественными за предоставление
аэронавигационной информации на обозначенной территории, чтобы ввести в действие особые меры управления двитжением.

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeDayType
 */
CREATE DOMAIN CodeDayType AS VARCHAR(40)
CHECK (VALUE ~
       '((MON|TUE|WED|THU|FRI|SAT|SUN|WORK_DAY|BEF_WORK_DAY|AFT_WORK_DAY|HOL|BEF_HOL|AFT_HOL|ANY|)|OTHER: [A-Z]{0,30})');

/*
Код, обозначающий событие (такое как рассвет или закат), которое указываеи на начало периода, описываемого в расписании.
SR - рассвет
SS - закат

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeTimeEventType
 */

CREATE DOMAIN CodeTimeEventType AS VARCHAR(40)
CHECK (VALUE ~ '((SR|SS)|OTHER: [A-Z]{0,30})');

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_UomDurationType
CREATE DOMAIN UomDurationType AS VARCHAR(40)
CHECK (VALUE ~ '((HR|MIN|SEC)|OTHER: [A-Z]{0,30})');
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValDurationType
CREATE TYPE ValDurationType AS (
  value DECIMAL,
  unit  UomDurationType,
  nilReason NilReasonEnumeration
);

/*
Код, показывающий, какое событие в списке событий по времени должно предшествовать остальным или идти после остальных.
EARLIEST - самое первое событие
LATEST - самое последнее

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeTimeEventCombinationType
 */
CREATE DOMAIN CodeTimeEventCombinationType AS VARCHAR(40)
CHECK (VALUE ~ '((EARLIEST|LATEST)|OTHER: [A-Z]{0,30})');

/*
Закодированное наименование обозначенной точки.

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeDesignatedPointDesignatorType
 */
CREATE DOMAIN CodeDesignatedPointDesignatorType AS VARCHAR(5)
CHECK (VALUE ~ '([A-Z]|\d)*');

/*
ICAO - 5-буквенный идентификатор названия
COORD - точка с идентификатором, производным от географических координат
CNF - Computer Navigation Fix - точка, используемая с целью обозначить навигационный путь в бортовой вычислительной машине (GPS, FMS).
  CNF включают в себя фиксированные дальномерные системы DME, начальные и конечные точки дуг DME, точки захода на посадку на GPS.
  Оборудование RNAV может создавать собственные точки, которые будут видны на дисплее, но которых нет в АИПах и на дисплеях диспетчеров ОВД. Эти точки создаются при активации из базы данных "наложенных" процедур SID, STAR и GPS-OVERLAY Approach.
DESIGNED - точка с наименованием в виде угла или расстояния, используемая как контрольная точка для процедуры проектирования, которая не публикается.
MTR  - точка, используемая в военных тренировочных путях.
TERMINAL - точка с 5-значным буквенно-цифровым наименованием, используемая как путевая точка в процедурах зональной навигации, но не имеющая 5-буквенника ИКАО.
BRG_DIST - точка с 5-значным буквенно-цифровым наименованием, составленным по правилам ARINC-424 для неименованных путевых точек.

https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeDesignatedPointType
 */
CREATE DOMAIN CodeDesignatedPointType AS VARCHAR(40)
CHECK (VALUE ~ '(ICAO|COORD|CNF|DESIGNED|MTR|TERMINAL|BRG_DIST)|OTHER: [A-Z]{0,30}');

/*
Код, указывающий тип азимутального оборудования: нормальное или обратное:
FWD - прямое
BWD - обратное
 */
CREATE DOMAIN CodeMLSAzimuthType AS VARCHAR(40)
CHECK (VALUE ~ 'FWD|BWD|OTHER: [A-Z]{0,30}');

--Код, указывающий канал, на котором работает микроволновая система посадки (от 500 до 699)
CREATE DOMAIN CodeMLSChannelType AS SMALLINT
CHECK (VALUE >= 500 AND VALUE <= 699);

/*
The particular spectrum characteristics or accuracy of Ultra High Frequency (UHF) Distance Measuring Equipment (DME), as a category.
Определенные спектральные характеристики или точность дальномерного оборудования дециметрового диапазона, как категории:

NARROW - характеристики узкого спектра
PRECISION
WIDE - широкоспектральные характеристики
 */
CREATE DOMAIN CodeDMEType AS VARCHAR(40)
CHECK (VALUE ~ 'NARROW|PRECISION|WIDE|OTHER: [A-Z]{0,30}');

-- Канал дальномерного оборудования (от 1 до 126 + индекс W,X,Y,Z)
CREATE DOMAIN CodeDMEChannelType AS VARCHAR(40)
CHECK (VALUE ~ '[0-9]{1,3}[W-Z]{1}|OTHER: [A-Z]{0,30}');

/*
Код, указывающий использование сигнала курсового посадочного радиомаяка (localizer) в секторе обратного направления.
Значения: YES, NO и RSTR (запрещено)
 */
CREATE DOMAIN CodeILSBackCourseType AS VARCHAR(40)
CHECK (VALUE ~ 'YES|NO|RSTR|OTHER: [A-Z]{0,30}');


/*
Код, указывающий класс маркерного радиомаяка:
FAN - маркерный радиомаяк с веерной диаграммой направленности антенны
LOW_PWR_FAN - маркерный радиомаяк с веерной диаграммой направленности антенны малой мощности
Z - Z-радиомаяк
BONES - маркерный радиомаяк в форме кости
 */
CREATE DOMAIN CodeMarkerBeaconSignalType AS VARCHAR(40)
CHECK (VALUE ~ 'FAN|LOW_PWR_FAN|Z|BONES|OTHER: [A-Z]{0,30}');

-- Последовательность точек и тире, соответствующих коду Морзе
CREATE DOMAIN CodeAuralMorseType AS VARCHAR(40)
CHECK (VALUE ~ '([\-\.]*)');

/*
Класс ненаправленного радиомаяка:
ENR - путевой ненаправленный радиомаяк
L - локатор - ненаправленный радиомаяк низкой мощности, используемые как помощь при финальном заходе (радиокомпас)
MAR - морской радиомаяк
 */
CREATE DOMAIN CodeNDBUsageType AS VARCHAR(40)
CHECK (VALUE ~ 'ENR|L|MAR|OTHER|OTHER: [A-Z]{0,30}');

/*
Тип полосы частот:
U - очень высокие частоты
H - высокие частоты
M - средние частоты
 */
CREATE DOMAIN CodeEmissionBandType AS VARCHAR(40)
CHECK (VALUE ~ 'U|H|M|OTHER: [A-Z]{0,30}');

-- A code indicating the channel of a TACAN. Код, обозначающий канал TACAN.
CREATE DOMAIN CodeTACANChannelType AS VARCHAR(40)
CHECK (VALUE ~ '1X|1Y|2X|2Y|3X|3Y|4X|4Y|5X|5Y|6X|6Y|7X|7Y|8X|8Y|9X|9Y|10X|10Y|11X|11Y|12X|12Y|13X|13Y|14X|14Y|15X|15Y|16X|16Y|17X|17Y|17Z|18X|18W|18Y|18Z||'
  '19X|19Y|19Z|20X|20W|20Y|20Z|21X|21Y|21Z|22X|22W|22Y|22Z|23X|23Y|23Z|24X|24W|24Y|24Z|25X|25Y|25Z|26X|26W|26Y|26Z|27X|27Y|27Z|28X|28W|28Y|28Z||'
  '29X|29Y|29Z|30X|30W|30Y|30Z|31X|31Y|31Z|32X|32W|32Y|32Z|33X|33Y|33Z|34X|34W|34Y|34Z|35X|35Y|35Z|36X|36W|36Y|36Z|37X|37Y|37Z|38X|38W|38Y|38Z||'
  '39X|39Y|39Z|40X|40W|40Y|40Z|41X|41Y|41Z|42X|42W|42Y|42Z|43X|43Y|43Z|44X|44W|44Y|44Z|45X|45Y|45Z|46X|46W|46Y|46Z|47X|47Y|47Z|48X|48W|48Y|48Z||'
  '49X|49Y|49Z|50X|50W|50Y|50Z|51X|51Y|51Z|52X|52W|52Y|52Z|53X|53Y|53Z|54X|54W|54Y|54Z|55X|55Y|55Z|56X|56W|56Y|56Z|57X|57Y|58X|58Y|59X|59Y|60X|60Y||'
  '61X|61Y|62X|62Y|63X|63Y|64X|64Y|65X|65Y|66X|66Y|67X|67Y|68X|68Y|69X|69Y|70X|70Y|71X|71Y|72X|72Y|73X|73Y|74X|74Y|75X|75Y|76X|76Y|77X|77Y|78X|78Y||'
  '79X|79Y|80X|80Y|80Z|81X|81Y|81Z|82X|82Y|82Z|83X|83Y|83Z|84X|84Y|84Z|85X|85Y|85Z|86X|86Y|86Z|87X|87Y|87Z|88X|88Y|88Z|89X|89Y|89Z|90X|90Y|90Z||'
  '91X|91Y|91Z|92X|92Y|92Z|93X|93Y|93Z|94X|94Y|94Z|95X|95Y|95Z|96X|96Y|96Z|97X|97Y|97Z|98X|98Y|98Z|99X|99Y|99Z|100X|100Y|100Z|101X|101Y|101Z|102X|102Y|102Z||'
  '103X|103Y|103Z|104X|104Y|104Z|105X|105Y|105Z|106X|106Y|106Z|107X|107Y|107Z|108X|108Y|108Z|109X|109Y|109Z|110X|110Y|110Z|111X|111Y|111Z|112X|112Y|112Z|113X|113Y|113Z|114X|114Y|114Z||'
  '115X|115Y|115Z|116X|116Y|116Z|117X|117Y|117Z|118X|118Y|118Z|119X|119Y|119Z|120X|120Y|121X|121Y|122X|122Y|123X|123Y|124X|124Y|125X|125Y|126X|126Y|OTHER: [A-Z]{0,30}');

/*
A code indicating the type of path to the next point. For example, great circle, clockwise arc, counter clockwise arc, etc.
Тип пути до следующей точки. Например: дуга большого круга, дуга по часовой стрелке, дуга против часовой стрелки
VOR - стандартный курсовой всенаправленный радиомаяк ОВЧ-диапазона
DVOR - доплеровский курсовой всенаправленный радиомаяк ОВЧ-диапазона
VOT - испытательное оборудование VOR
*/
CREATE DOMAIN CodeVORType AS VARCHAR(40)
CHECK (VALUE ~ 'VOR|DVOR|VOT|OTHER: [A-Z]{0,30}');

/*
A code indicating the type of the North reference used. Используемый тип северного полюса.
TRUE - истинный
MAG - магнитный
GRID - направление линий север-юг сетки UTM, наложенной на топографические карты США или НАТО.
The direction of the north-south lines of the Universal Transverse Mercator (UTM) grid imposed on topographic maps by the United States and NATO.
https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_CodeNorthReferenceType
 */
CREATE DOMAIN CodeNorthReferenceType AS VARCHAR(40)
CHECK (VALUE ~ 'TRUE|MAG|GRID|OTHER: [A-Z]{0,30}');

/*
Тип пространства, покрываемого препятствием:
AREA1 - ICAO Area 1: вся территория области (штата)
AREA2 - ICAO Area 2: терминальная зона управления
AREA3 - ICAO Area 3: зона аэродрома/вертодрома
AREA4 - ICAO Area 4: зона операций категории II и III
OLS - ICAO Annex 14 поверхность ограничения препятствия
FAR77 - FAA Regulations Part 77 Obstacle Limitation Surfaces
MANAGED - A 'virtual' area containing the VerticalStructures included in the data collection exercise, which do not qualify yet as Obstacles in any specific Area
 */
CREATE DOMAIN CodeObstacleAreaType AS VARCHAR(40)
CHECK (VALUE ~ 'AREA1|AREA2|AREA3|AREA4|OLS|FAR77|MANAGED|OTHER: [A-Z]{0,30}');

/*
40_TO_1	- 40 to 1 sloped surface.
72_TO_1	-	72 to 1 sloped surface.
MA	-	Missed approach area.
FINAL	-	Final approach area.
PT_ENTRY_AREA	-	Procedure turn entry area.
PRIMARY	-	Primary area.
SECONDARY	-	Secondary Area.
ZONE1
ZONE2
ZONE3
AREA1
AREA2
AREA3
TURN_INITIATION
TURN
DER	-	Departure End of Runway Area
 */
CREATE DOMAIN CodeObstacleAssessmentSurfaceType AS VARCHAR(40)
CHECK (VALUE ~
       '40_TO_1|72_TO_1|MA|PT_ENTRY_AREA|PRIMARY|SECONDARY|ZONE1|ZONE2|ZONE3|AREA1|AREA2|AREA3|TURN_INITIATION|TURN|DER|OTHER: [A-Z]{0,30}');

/*
AG_EQUIP - сельскохозяйственное оборудование
ANTENNA
ARCH - арка
BRIDGE - мост
BUILDING - строение
CABLE_CAR - вагон канатной дороги, фуникулёра
CATENARY - цепная линия (электрический провод)
COMPRESSED_AIR_SYSTEM - компонент системы воздуховода для сжатого воздуха
CONTROL_MONITORING_SYSTEM
CONTROL_TOWER - диспетчерская вышка
COOLING_TOWER - охлаждающая башня
CRANE - (грузо)подъёмный кран
DAM - дамба
DOME - купол
ELECTRICAL_EXIT_LIGHT - компоненты внешней электрической системы освещения, включая кабели, переключатели, приборы, трансформаторы и т.д. Не включают РНС
ELECTRICAL_SYSTEM - компоненты распределенной электрической системы, включая кабели, переключатели, приборы, двигатели, трансформаторы
ELEVATOR - лифт
FENCE - ограждение, забор
FUEL_SYSTEM - составляющие топливной распределительной системы, состоящие из трубопроводов, арматуры, насосов, цистерн и т.д.
GATE - проход - часть ограждения, которая может быть открыта для прохода через ограждение или наоброт закрыта.
GENERAL_UTILITY - компоненты энергосистемы общего пользования, являющиеся универсальными в использовании и в назначении и не принадлежат какой-то особой энергосистеме.
GRAIN_ELEVATOR - зерновой элеватор
HEAT_COOL_SYSTEM - составляющие распределенной системы охлождения и отопления, состоящие из труб, фурнитуры, арматуры и т.д.
INDUSTRIAL_SYSTEM - составляющие системы сбора отходов, состоящие из труб, фурнитуры, арматуры, резервуары и т.д.
LIGHTHOUSE - маяк
MONUMENT
NATURAL_GAS_SYSTEM - составляющие газораспределительной системы
NATURAL_HIGHPOINT - естественная командная высота
NAVAID - РНС
NUCLEAR_REACTOR - ядерный реактор
POLE - столб, шест, жердь
POWER_PLANT - электростанция
REFINERY - нефтеперегонный завод
RIG - нефтяная вышка
SALTWATER_SYSTEM - составляющие системы сбора соленой воды
SIGN - вывеска
SPIRE - шпиль
STACK - дымовая труба
STADIUM - стадион
STORM_SYSTEM - состсавляющие дренажной штормовой системы сбора
TANK - резервуар
TETHERED_BALLOON - привязной аэростат
TOWER - башня
TRAMWAY - трамвайная линия
TRANSMISSION_LINE - линия передачи
TREE - дерево
URBAN - городская зона
VEGETATION - растительность
WALL - стена
WASTEWATER_SYSTEM - составляющие системы сбора сточной воды
WATER_SYSTEM - составляющие системы водоснабжения
WATER_TOWER - водонапорная башня
WINDMILL - ветряк, ветродвигатель
WINDMILL_FARMS - ветроэнергоцентр
 */
CREATE DOMAIN CodeVerticalStructureType AS VARCHAR(40)
CHECK (VALUE ~ 'AG_EQUIP|ANTENNA|ARCH|BRIDGE|BUILDING|CABLE_CAR|CATENARY|COMPRESSED_AIR_SYSTEM|CONTROL_MONITORING_SYSTEM|||chr(10)||'
'CONTROL_TOWER|COOLING_TOWER|CRANE|DAM|DOME|ELECTRICAL_EXIT_LIGHT|ELECTRICAL_SYSTEM|ELEVATOR|FENCE|FUEL_SYSTEM|GATE|||chr(10)||'
'GENERAL_UTILITY|GRAIN_ELEVATOR|HEAT_COOL_SYSTEM|INDUSTRIAL_SYSTEM|LIGHTHOUSE|MONUMENT|NATURAL_GAS_SYSTEM|NATURAL_HIGHPOINT|||chr(10)||'
'NAVAID|NUCLEAR_REACTOR|OTHER|POLE|POWER_PLANT|REFINERY|RIG|SALTWATER_SYSTEM|SIGN|SPIRE|STACK|STADIUM|STORM_SYSTEM|TANK|||chr(10)||'
'TETHERED_BALLOON|TOWER|TRAMWAY|TRANSMISSION_LINE|TREE|URBAN|VEGETATION|WALL|WASTEWATER_SYSTEM|WATER_SYSTEM|WATER_TOWER|||chr(10)||'
'WINDMILL|WINDMILL_FARMS: [A-Z]{0,40}');

/*
Статус постройки:
IN_CONSTRUCTION - в строительстве
COMPLETED - строительство завершено
DEMOLITION_PLANNED - планируется снов
IN_DEMOLITION - в состоянии ликвидации (сноса)
 */
CREATE DOMAIN CodeStatusConstructionType AS VARCHAR(40)
CHECK (VALUE ~ 'IN_CONSTRUCTION|COMPLETED|DEMOLITION_PLANNED|IN_DEMOLITION|OTHER: [A-Z]{0,30}');

/*
Тип и структура разметки (маркировки) вертикальной структуры:
MONOCOLOUR - одноцветная
CHEQUERED - клетчатая текстура
HBANDS - горизонтальное обрамление (полосы)
VBANDS - вертикальное обрамление (полосы)
FLAG - клетчатый флаг
MARKERS - маркировочный знаки, прикрепленные к кабелям или электрическим проводам
 */
CREATE DOMAIN CodeVerticalStructureMarkingType AS VARCHAR(40)
CHECK (VALUE ~ 'MONOCOLOUR|CHEQUERED|HBANDS|VBANDS|FLAG|MARKERS|OTHER: [A-Z]{0,30}');

/*
ADOBE_BRICK - кирпич из глины и соломы, высушенный на солнце, а не в огненной печи (как обычные кирпичи).
ALUMINIUM
BRICK
CONCRETE
FIBREGLASS - стекловолокно
GLASS
IRON - железо
MASONRY - каменная кладка
METAL
MUD
PLANT
PRESTRESSED_CONCRETE
REINFORCED_CONCRETE
SOD - дёрн, земля
STEEL
STONE
TREATED_TIMBER - пропитанная древесина
WOOD
 */

CREATE DOMAIN CodeVerticalStructureMaterialType AS VARCHAR(40) CHECK (VALUE ~
'ADOBE_BRICK|ALUMINIUM|BRICK|CONCRETE|FIBREGLASS|GLASS|IRON|MASONRY|METAL|MUD|PLANT|PRESTRESSED_CONCRETE||'
'REINFORCED_CONCRETE|SOD|STEEL|STONE|TREATED_TIMBER|WOOD|OTHER: [A-Z]{0,30}');

CREATE DOMAIN TimesliceInterpretationType AS VARCHAR(40)
CHECK (VALUE ~ 'BASELINE|PERMDELTA|SNAPSHOT|TEMPDELTA|OTHER: [A-Z]{0,30}');

CREATE DOMAIN CodeHoldingUsageBaseType as varchar(10) CHECK (VALUE ~ '(ENR|TER|OTHER)'::text);

create TYPE CodeHoldingUsageType AS (
    nilReason NilReasonEnumeration,
    value CodeHoldingUsageBaseType
    );

CREATE DOMAIN CodeCourseBaseType as varchar(10) CHECK (VALUE ~ '(TRUE_TRACK|MAG_TRACK|TRUE_BRG|MAG_BRG|HDG|RDL|OTHER)'::text);
create TYPE CodeCourseType AS (
    nilReason NilReasonEnumeration,
    value CodeCourseBaseType
    );

CREATE DOMAIN ValSpeedBaseType AS DECIMAL CHECK (VALUE >= 0);
CREATE DOMAIN UomSpeedType as varchar(10) CHECK (VALUE ~ '(KM_H|KT|MACH|M_MIN|FT_MIN|M_SEC|FT_SEC|MPH|OTHER)'::text);

create TYPE ValSpeedType AS (
    uom UomSpeedType,
    minInclusive ValSpeedBaseType,
    nilReason NilReasonEnumeration
    );

CREATE DOMAIN CodeDirectionBaseType as varchar(10) CHECK (VALUE ~ '(FORWARD|BACKWARD|BOTH|OTHER)'::text);
create TYPE CodeDirectionType AS (
    nilReason NilReasonEnumeration,
    value CodeDirectionBaseType
    );


CREATE DOMAIN CodeCardinalDirectionBaseType as varchar(10) CHECK (VALUE ~
'(N|NE|E|SE|S|SW|W|NW|NNE|ENE|ESE|SSE|SSW|WSW|WNW|NNW|OTHER)'::text);
create TYPE CodeCardinalDirectionType AS (
    nilReason NilReasonEnumeration,
    value CodeCardinalDirectionBaseType
    );


CREATE DOMAIN CodeRouteAvailabilityBaseType as varchar(10) CHECK (VALUE ~ '(OPEN|COND|CLSD|OTHER)'::text);
create TYPE CodeRouteAvailabilityType AS (
    nilReason NilReasonEnumeration,
    value CodeRouteAvailabilityBaseType
    );


CREATE DOMAIN CodeNotePurposeBaseType as varchar (20) CHECK (VALUE ~ '(DESCRIPTION|REMARK|WARNING|DISCLAIMER|OTHER)'::text);
create TYPE CodeNotePurposeType AS (
    nilReason NilReasonEnumeration,
    value CodeNotePurposeBaseType
    );

CREATE DOMAIN CodeRunwayPointRoleBaseType as varchar (20) CHECK (VALUE ~
'(START|THR|DISTHR|TDZ|MID|END|START_RUN|LAHSO|ABEAM_GLIDESLOPE|ABEAM_PAR|ABEAM_ELEVATION|ABEAM_TDR|ABEAM_RER|OTHER)'::text);
create TYPE CodeRunwayPointRoleType AS (
    nilReason NilReasonEnumeration,
    value CodeRunwayPointRoleBaseType
    );

CREATE DOMAIN CodeReferenceRoleBaseType as varchar (20) CHECK (VALUE ~ '(INTERSECTION|RECNAV|ATD|RAD_DME|OTHER)'::text);
create TYPE CodeReferenceRoleType AS (
    nilReason NilReasonEnumeration,
    value CodeReferenceRoleBaseType
    );

CREATE DOMAIN CodeBearingBaseType as varchar (20) CHECK (VALUE ~ '(TRUE|MAG|RDL|TRK|HDG|OTHER)'::text);
create TYPE CodeBearingType AS (
    nilReason NilReasonEnumeration,
    value CodeBearingBaseType
    );

CREATE DOMAIN CodeDistanceIndicationBaseType as varchar (20) CHECK (VALUE ~ '(DME|GEODETIC|OTHER)'::text);
create TYPE CodeDistanceIndicationType AS (
    nilReason NilReasonEnumeration,
    value CodeDistanceIndicationBaseType
    );

CREATE DOMAIN CodeProcedurePhaseBaseType as varchar (20) CHECK (VALUE ~
'(RWY|COMMON|EN_ROUTE|APPROACH|FINAL|MISSED|MISSED_P|MISSED_S|ENGINE_OUT|OTHER)'::text);
create TYPE CodeProcedurePhaseType AS (
    nilReason NilReasonEnumeration,
    value CodeProcedurePhaseBaseType
    );

CREATE DOMAIN CodeApproachPrefixBaseType as varchar (20) CHECK (VALUE ~ '(HI|COPTER|CONVERGING|OTHER)'::text);
create TYPE CodeApproachPrefixType AS (
    nilReason NilReasonEnumeration,
    value CodeApproachPrefixBaseType
    );

CREATE DOMAIN CodeApproachBaseType as varchar (20) CHECK (VALUE ~
'(ASR|ARA|ARSR|PAR|ILS|ILS_DME|ILS_PRM|LDA|LDA_DME|LOC|LOC_BC|LOC_DME|LOC_DME_BC|MLS|MLS_DME|NDB|NDB_DME|SDF|TLS|VOR||'
'VOR_DME|TACAN|VORTAC|DME|DME_DME|RNP|GPS|GLONASS|GALILEO|RNAVIGS|OTHER)'::text);
create TYPE CodeApproachType AS (
    nilReason NilReasonEnumeration,
    value CodeApproachBaseType
    );

CREATE DOMAIN CodeApproachEquipmentAdditionalBaseType as varchar (20) CHECK (VALUE ~
'(ADF|DME|RADAR|RADARDME|VORLOC|DUALVORDME|DUALADF|ADFMA|SPECIAL|DUALVHF|GPSRNP3|ADFILS|DUALADF_DME|RADAR_RNAV|OTHER)'::text);
create TYPE CodeApproachEquipmentAdditionalType AS (
    nilReason NilReasonEnumeration,
    value CodeApproachEquipmentAdditionalBaseType
    );

CREATE DOMAIN CodeMissedApproachBaseType as varchar (20) CHECK (VALUE ~
'(PRIMARY|SECONDARY|ALTERNATE|TACAN|TACANALT|ENGINEOUT|OTHER)'::text);
create TYPE CodeMissedApproachType AS (
    nilReason NilReasonEnumeration,
    value CodeMissedApproachBaseType
    );

CREATE DOMAIN TextSIDSTARDesignatorBaseType AS DECIMAL(30, 20)
CHECK (VALUE >= 0);
CREATE DOMAIN Character1Type AS VARCHAR(12)
CHECK (VALUE ~ '([A-Z]|[0-9])+([ \+\-/]*([A-Z]|[0-9])+)*');
-- A (positive) distance.
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/DataType_ValDistanceType
CREATE TYPE TextSIDSTARDesignatorType AS (
    nilReason   NilReasonEnumeration,
    maxLength   TextSIDSTARDesignatorBaseType,
    minLength   TextSIDSTARDesignatorBaseType,
    pattern     Character1Type
);
CREATE DOMAIN ValChannelNumberBaseType as varchar (20);
create TYPE ValChannelNumberType AS (
    nilReason NilReasonEnumeration,
    value ValChannelNumberBaseType
    );

CREATE DOMAIN NoSequenceBaseType as varchar (20);
create TYPE NoSequenceType AS (
    --nilReason NilReasonEnumeration,
    value NoSequenceBaseType
    );

CREATE DOMAIN CodeSegmentTerminationBaseType as varchar (20) CHECK (VALUE ~ '(ALTITUDE|DISTANCE|DURATION|INTERCEPT|OTHER)'::text);;
create TYPE CodeSegmentTerminationType AS (
    nilReason NilReasonEnumeration,
    value CodeSegmentTerminationBaseType
    );

CREATE DOMAIN CodeTrajectoryBaseType as varchar (20) CHECK (VALUE ~ '(STRAIGHT|ARC|PT|BASETURN|HOLDING|OTHER)'::text);;
create TYPE CodeTrajectoryType AS (
    nilReason NilReasonEnumeration,
    value CodeTrajectoryBaseType
    );

CREATE DOMAIN CodeSegmentPathBaseType as varchar (20) CHECK (VALUE ~ '(AF|HF|HA|HM|IF|PI|PT|TF|CA|CD|CI|CR|CF|DF|FA||'
'FC|FT|FM|VM|FD|VR|VD|VI|VA|RF|OTHER)'::text);;
create TYPE CodeSegmentPathType AS (
    nilReason NilReasonEnumeration,
    value CodeSegmentPathBaseType
    );

CREATE DOMAIN CodeDirectionReferenceBaseType as varchar (20) CHECK (VALUE ~ '(TO|FROM|OTHER)'::text);;
create TYPE CodeDirectionReferenceType AS (
    nilReason NilReasonEnumeration,
    value CodeDirectionReferenceBaseType
    );

CREATE DOMAIN CodeSpeedReferenceBaseType as varchar (20) CHECK (VALUE ~ '(IAS|TAS|GS|OTHER)'::text);;
create TYPE CodeSpeedReferenceType AS (
    nilReason NilReasonEnumeration,
    value CodeSpeedReferenceBaseType
    );

CREATE DOMAIN CodeAircraftCategoryBaseType as varchar (20) CHECK (VALUE ~ '(A|B|C|D|E|H|ALL|OTHER)'::text);;
create TYPE CodeAircraftCategoryType AS (
    nilReason NilReasonEnumeration,
    value CodeAircraftCategoryBaseType
    );

create TYPE IncludingValueType AS (
    nilReason NilReasonEnumeration,
    value BOOLEAN
    );

CREATE DOMAIN CodeSafeAltitudeBaseType as varchar (20) CHECK (VALUE ~ '(MSA|ESA|OTHER)'::text);
create TYPE CodeSafeAltitudeType AS (
    nilReason NilReasonEnumeration,
    value CodeSafeAltitudeBaseType
    );

CREATE DOMAIN CodeArcDirectionBaseType as varchar (20) CHECK (VALUE ~ '(CWA|CCA|OTHER)'::text);
create TYPE CodeArcDirectionType AS (
    nilReason NilReasonEnumeration,
    value CodeArcDirectionBaseType
    );


DROP SEQUENCE IF EXISTS auto_id_timesheet, auto_id_city, auto_id_point, auto_idSignificantpoint, auto_id_curve,
    auto_id_surface, auto_id_altimeter_source_status, auto_id_surface_contamination, auto_id_surface_characteristics,
auto_id_unit_dependency, auto_id_callsign, auto_id_contact_information, auto_id_postal_address, auto_id_online_contact,
auto_id_segment_point, auto_id_route_portion, auto_id_airspace_layer_class, auto_id_airspace_layer,
auto_id_airspace_volume, auto_id_telephone_contact, auto_ground_lighting_availability, auto_id_properties_with_schedule,
auto_id_timeslice, auto_id_HoldingPatternLength, auto_id_HoldingPatternDistance, auto_id_HoldingPatternDuration,
    auto_id_translate, auto_id_callsignTranslate, auto_id_Landing CASCADE;

CREATE SEQUENCE auto_id_properties_with_schedule;
CREATE SEQUENCE auto_id_timesheet;
CREATE SEQUENCE auto_id_city;
CREATE SEQUENCE auto_id_point;
CREATE SEQUENCE auto_idSignificantpoint;
CREATE SEQUENCE auto_id_curve;
CREATE SEQUENCE auto_id_surface;
CREATE SEQUENCE auto_id_altimeter_source_status;
CREATE SEQUENCE auto_id_surface_contamination;
CREATE SEQUENCE auto_id_surface_characteristics;
CREATE SEQUENCE auto_id_unit_dependency;
CREATE SEQUENCE auto_id_callsign;
CREATE SEQUENCE auto_id_contact_information;
CREATE SEQUENCE auto_id_postal_address;
CREATE SEQUENCE auto_id_online_contact;
CREATE SEQUENCE auto_id_segment_point;
CREATE SEQUENCE auto_id_route_portion;
CREATE SEQUENCE auto_id_airspace_layer_class;
CREATE SEQUENCE auto_id_airspace_layer;
CREATE SEQUENCE auto_id_airspace_volume;
CREATE SEQUENCE auto_id_telephone_contact;
CREATE SEQUENCE auto_ground_lighting_availability;
CREATE SEQUENCE auto_id_timeslice;
CREATE SEQUENCE auto_id_HoldingPatternLength;
CREATE SEQUENCE auto_id_HoldingPatternDistance;
CREATE SEQUENCE auto_id_HoldingPatternDuration;
CREATE SEQUENCE auto_id_translate;
CREATE SEQUENCE auto_id_callsignTranslate;
CREATE SEQUENCE auto_id_Landing;
