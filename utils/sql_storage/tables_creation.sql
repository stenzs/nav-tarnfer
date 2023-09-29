
DROP TABLE IF EXISTS AirportHeliport, AirportHeliportTimeSlice, City, Surface, Point, ElevatedPoint, SurveyControlPoint, ElevatedSurface,
AirportHotSpot, AltimeterSource_AirportHeliport, AltimeterSource, AltimeterSourceStatus, OrganisationAuthority,
ContactInformation, SurfaceContamination, AirportHeliportContamination, Runway,
SurfaceCharacteristics, RunwayContamination, RunwaySectionContamination, RunwayDirection, GroundLightSystem,
RunwayDirectionLightSystem, PostalAddress, OnlineContact, TelephoneContact, ContactInformationOnlineContact,
ContactInformationTelephoneContact, ContactInformationPostalAddress, AirportHeliportCity,
AirTrafficManagementService, AirportGroundService, InformationService, SearchRescueService, Airspace, AirspaceLayerClass,
AirspaceLayer, RoutePortion, SegmentPoint, RouteSegment, Route, AirspaceVolume, AirspaceActivation,
AirspaceActivation_OrganisationAuthority, SignificantPointInAirspace, Curve,
Unit_Service, UnitDependency, CallsignDetail, radiocommunicationchannel,
service_radiocommunicationchannel, trafficseparationservice, airtrafficcontrolservice,
Navaid, GroundLightingAvailability, groundtrafficcontrolservice, AircraftGroundService,
OrganisationAuthority_PropertiesWithSchedule, PropertiesWithSchedule, Timesheet, airportheliport_navaid, DesignatedPoint,
NavaidEquipment, Azimuth, DME, DirectionFinder,
Localizer, Elevation, Glidepath, MarkerBeacon, NDB, TACAN, SDF, VOR, RSNN, Navaid_NavaidEquipment, ObstacleArea,
VerticalStructure, ObstacleArea_VerticalStructure, GroundLightSystem_VerticalStructure,
NavaidEquipment_VerticalStructure, OrganisationAuthority_VerticalStructure, Unit_VerticalStructure, Service_VerticalStructure,
VerticalStructurePart, VerticalStructurePartGeometry, CartographyLabel_OBS, cartographylabel_fir, elevatedcurve,
timesliceinterpretationtype, timeslice,
SurveyControlPointTimeSlice, AirportHotSpotTimeSlice, AltimeterSourceTimeSlice,
SignificantPointInAirspaceTimeSlice,
ObstacleAreaTimeSlice,
RunwayDirectionLightSystemTimeSlice, procedure,
runwayelement, channel_frequency_pair, GroundBasedAugmentationSystem, airspace_note,
GridMORA, HoldingPatternDistance, HoldingPatternDuration, HoldingPattern, Note, RouteSegment_Note,
RadioCommunicationOperationalStatus,
"ARP_data", "ALS_data", "NAV_data", "TPM_data", "TPT_data", "TRA_data", "RWY_data", "MVL_data", "RSA_data", "CTA_data",
"CAA_data", "CTB_data", "CTC_data", "OBS_data", "RDA_data", "RDC_data", "CTR_data", "TMA_data", "UAA_data", "FIR_data", "SECTOR_data",
"MET_data", "HOLD_data", "1degree_data", "2degree_data", RunwayCentrelinePoint,
PointReference, AngleIndication, DistanceIndication, ProcedureTransition, SegmentLeg, InstrumentApproachProcedure, AngleUse,
ProcedureTransitionLeg, MissedApproachLeg, DepartureLeg,
StandardInstrumentDeparture, PointReferenceDistanceIndication,
SegmentLegTimeSlice, SegmentPointReference, StandardInstrumentArrival, FinalLeg,
InitialLeg, ArrivalLeg, ApproachLeg, Airspace_Service, AirportHeliport_Service,
AircraftCharacteristic, SpecialNavigationSystem, SpecialNavigationStation, bigorgdata, SafeAltitudeArea, SafeAltitudeAreaSector
CASCADE;


CREATE TABLE timeslice
(
  idTimeSlice                     INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
  validTimeBegin                  DateType,
  validTimeEnd                    DateType,
  interpretation                  TimesliceInterpretationType,
  sequenceNumber                  NoNumberType,
  correctionNumber                NoNumberType
);

CREATE TABLE AirportHeliport
(
    uuid                            id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                      VARCHAR(20)
);

CREATE TABLE AirportHeliportTimeSlice
(
    idTimeSlice                     INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                            id REFERENCES AirportHeliport (uuid),
    latitude                        latitude,
    longitude                       longitude,
    srid                            INTEGER REFERENCES spatial_ref_sys (srid),
    geom                            GEOMETRY(POINT, 4326),
    elevation                       ValDistanceVerticalType,
    geoidUndulation                 ValDistanceSignedType,
    verticalDatum                   CodeVerticalDatumType,
    verticalAccuracy                ValDistanceType,
    translation                     VARCHAR,
    designator                      CodeAirportHeliportDesignatorType,
    designatorIATA                  CodeIATAType,
    name                            TextNameType,
    locationIndicatorICAO           CodeICAOType,
    type                            CodeAirportHeliportType,
    controlType                     CodeMilitaryOperationsType,
    abandoned                       CodeYesNoType,
    lighting_                       VARCHAR,
    source_                         VARCHAR,
    flight_rules_                   VARCHAR,
    aip_                            VARCHAR,
    idPropertiesWithSchedule        INTEGER UNIQUE DEFAULT nextval('auto_id_properties_with_schedule'),
    operationalStatus               CodeStatusAirportType,
    certifiedICAO                   CodeYesNoType,
    privateUse                      CodeYesNoType,
    fieldElevation                  ValDistanceVerticalType,
    fieldElevationAccuracy          ValDistanceVerticalType,
    magneticVariation               ValMagneticVariationType,
    magneticVariationAccuracy       ValAngleType,
    dateMagneticVariation           DateYearType,
    magneticVariationChange         ValMagneticVariationChangeType,
    referenceTemperature            ValTemperatureType,
    altimeterCheckLocation          CodeYesNoType,
    secondaryPowerSupply            CodeYesNoType,
    windDirectionIndicator          CodeYesNoType,
    landingDirectionIndicator       CodeYesNoType,
    transitionAltitude              ValDistanceVerticalType,
    transitionLevel                 ValFLType,
    lowestTemperature               ValTemperatureType,
    certificationDate               DateType,
    certificationExpirationDate     DateType,
    --- uuidOrganisationAuthority       id REFERENCES OrganisationAuthority (uuid),
    idelevatedpoint                 INTEGER unique DEFAULT nextval('auto_id_point'),
    idSignificantpoint              INTEGER DEFAULT nextval('auto_idSignificantpoint'),
    --- idElevatedSurface           INTEGER REFERENCES ElevatedSurface (id),
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE HoldingPattern
(
    uuid                    id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID              VARCHAR(20)
);

CREATE TABLE HoldingPatternTimeSlice
(
    idTimeSlice             INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                    id REFERENCES HoldingPattern (uuid),
    length                  ValDistanceType,
    duration                ValDurationType,
    coord                   VARCHAR,
    srid                    INTEGER REFERENCES spatial_ref_sys (srid),
    horizontalAccuracy      ValDistanceType,
    geom                    GEOMETRY(LINESTRING, 4326),
    type                    CodeHoldingUsageType,
    outboundCourse          ValBearingType,
    outboundCourseType      CodeCourseType,
    inboundCourse           ValBearingType,
    inboundCourseType       CodeCourseType,
    turnDirection           CodeDirectionTurnType,
    upperLimit              ValDistanceVerticalType,
    upperLimitReference     CodeVerticalReferenceType,
    lowerLimit              ValDistanceVerticalType,
    lowerLimitReference     CodeVerticalReferenceType,
    upperIncludingValue     IncludingValueType,
    lowerIncludingValue     IncludingValueType,
    speedLimit              ValSpeedType,
    instruction             TextInstructionType,
    nonStandardHolding      CodeYesNoType,
    idSegmentPoint          INTEGER, --- REFERENCES EnRouteSegmentPoint (id) ON DELETE CASCADE ON UPDATE CASCADE,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE Navaid
(
    uuid                            id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                      VARCHAR(20) UNIQUE

);

CREATE TABLE NavaidTimeSlice
(
    idTimeSlice                     INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                            id REFERENCES Navaid (uuid),
    type                            CodeNavaidServiceType,
    designator                      CodeNavaidDesignatorType,
    name                            TextNameType,
    flightChecked                   CodeYesNoType,
    purpose                         CodeNavaidPurposeType,
    signalPerformance               CodeSignalPerformanceILSType,
    courseQuality                   CodeCourseQualityILSType,
    integrityLevel                  CodeIntegrityLevelILSType,
    latitude                        latitude,
    longitude                       longitude,
    srid                            INTEGER REFERENCES spatial_ref_sys (srid),
    horizontalAccuracy              ValDistanceType,
    magneticVariation               ValMagneticVariationType,
    geom                            GEOMETRY(POINT, 4326),
    elevation                       ValDistanceVerticalType,
    geoidUndulation                 ValDistanceSignedType,
    verticalDatum                   CodeVerticalDatumType,
    verticalAccuracy                ValDistanceType,
    translation                     VARCHAR,
    idelevatedpoint                 INTEGER unique DEFAULT nextval('auto_id_point'),
    idSignificantpoint              INTEGER DEFAULT nextval('auto_idSignificantpoint'),
    uuidarphlp                      id REFERENCES AirportHeliport (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);


CREATE TABLE NavaidEquipment
(
    uuid                      id PRIMARY KEY DEFAULT uuid_generate_v4()
);

CREATE TABLE NavaidEquipmentTimeslice
(
    idTimeSlice               INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                      id REFERENCES NavaidEquipment (uuid),
    designator                CodeNavaidDesignatorType,
    name                      TextNameType,
    emissionClass             CodeRadioEmissionType,
    mobile                    CodeYesNoType,
    magneticVariation         ValMagneticVariationType,
    magneticVariationAccuracy ValAngleType,
    dateMagneticVariation     DateYearType,
    flightChecked             CodeYesNoType,
    latitude                  latitude,
    longitude                 longitude,
    _transasID                VARCHAR(20),
    geom                      GEOMETRY(POINT, 4326),
    srid                      INTEGER REFERENCES spatial_ref_sys (srid),
    idelevatedpoint           INTEGER unique DEFAULT nextval('auto_id_point'),
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);


-- Связующая таблица для реализации связи многие-ко-многим таблиц аэродромов и РНС
CREATE TABLE AirportHeliport_Navaid
(
  uuidNavaid        id REFERENCES Navaid (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  uuidarphlp        id REFERENCES AirportHeliport (uuid) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE Runway
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                  VARCHAR(20)
);

CREATE TABLE RunwayTimeSlice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES Runway (uuid),
    uuidarphlp                  id REFERENCES AirportHeliport (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    designator                  TextDesignatorType,
    type                        CodeRunwayType,
    nominalLength               ValDistanceType,
    lengthAccuracy              ValDistanceType,
    nominalWidth                ValDistanceType,
    widthAccuracy               ValDistanceType,
    widthShoulder               ValDistanceType,
    lengthStrip                 ValDistanceType,
    widthStrip                  ValDistanceType,
    lengthOffset                ValDistanceSignedType,
    widthOffset                 ValDistanceSignedType,
    abandoned                   CodeYesNoType,
    composition                 CodeSurfaceCompositionType,
    preparation                 CodeSurfacePreparationType,
    surfaceCondition            CodeSurfaceConditionType,
    classPCN                    ValPCNType,
    pavementTypePCN             CodePCNPavementType,
    pavementSubgradePCN         CodePCNSubgradeType,
    maxTyrePressurePCN          CodePCNTyrePressureType,
    evaluationMethodPCN         CodePCNMethodType,
    classLCN                    ValLCNType,
    weightSIWL                  ValWeightType,
    tyrePressureSIWL            ValPressureType,
    weightAUW                   ValWeightType,
    type_element                CodeRunwayElementType,
    length            	        ValDistanceType,
    width 	                    ValDistanceType,
    gradeSeparation 	        CodeGradeSeparationType,
    horizontalAccuracy          ValDistanceType,
    latitude                    latitude,
    longitude                   longitude,
    coord                       VARCHAR,
    srid                        INTEGER REFERENCES spatial_ref_sys (srid),
    geom                        GEOMETRY(POLYGON, 4326),
    idelevatedsurface           INTEGER UNIQUE DEFAULT nextval('auto_id_surface'),
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE RunwayDirection
(
    uuid                      id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                VARCHAR(20)
);


CREATE TABLE RunwayDirectionTimeslice
(
    idTimeSlice               INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                      id REFERENCES RunwayDirection (uuid),
    uuidRunway                id REFERENCES Runway (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    designator                TextDesignatorType,
    trueBearing               ValBearingType,
    trueBearingAccuracy       ValAngleType,
    magneticBearing           ValBearingType,
    patternVFR                CodeDirectionTurnType,
    slopeTDZ                  ValSlopeType,
    elevationTDZ              ValDistanceVerticalType,
    elevationTDZAccuracy      ValDistanceType,
    approachMarkingType       CodeRunwayMarkingType,
    approachMarkingCondition  CodeMarkingConditionType,
    classLightingJAR          CodeLightingJARType,
    precisionApproachGuidance CodeApproachGuidanceType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE PropertiesWithSchedule
(
  id INTEGER UNIQUE DEFAULT nextval('auto_id_properties_with_schedule')
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Timesheet
CREATE TABLE Timesheet
(
  id                       INTEGER PRIMARY KEY DEFAULT nextval('auto_id_timesheet'),
  timeReference            CodeTimeReferenceType,
  startDate                DateMonthDayType,
  endDate                  DateMonthDayType,
  day                      CodeDayType,
  dayTil                   CodeDayType,
  startTime                TimeType,
  startEvent               CodeTimeEventType,
  startTimeRelativeEvent   ValDurationType,
  startEventInterpretation CodeTimeEventCombinationType,
  endTime                  TimeType,
  endEvent                 CodeTimeEventType,
  endTimeRelativeEvent     ValDurationType,
  endEventInterpretation   CodeTimeEventCombinationType,
  daylightSavingAdjust     CodeYesNoType,
  excluded                 CodeYesNoType,
  idPropertiesWithSchedule INTEGER
);


CREATE TABLE Note
(
    id           SERIAL PRIMARY KEY,
    propertyName VARCHAR,
    purpose      CodeNotePurposeType
);


CREATE TABLE GridMORA
(
  id            SERIAL PRIMARY KEY,
  altitude      INT,
  areacode      CHAR(3),
  geom          GEOMETRY(POLYGON, 4326)
);

--  https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_OrganisationAuthority

CREATE TABLE OrganisationAuthority
(
    uuid                            id PRIMARY KEY DEFAULT uuid_generate_v4()
);

CREATE TABLE OrganisationAuthorityTimeslice
(
    idTimeSlice                     INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                            id REFERENCES OrganisationAuthority (uuid),
    name                            TextNameType,
    designator                      CodeOrganisationDesignatorType,
    type                            CodeOrganisationType,
    military                        CodeMilitaryOperationsType,
    --- AuthorityForAirspace
    authority_type                  CodeAuthorityType,
    uuidairspc                      id,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE OrganisationAuthority_PropertiesWithSchedule
(
  uuidOrganisationAuthority id REFERENCES OrganisationAuthority (uuid),
  idPropertiesWithSchedule  INTEGER REFERENCES PropertiesWithSchedule (id)
);


-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Point/
CREATE TABLE Point
(
  id                 INTEGER PRIMARY KEY DEFAULT nextval('auto_id_point'),
  latitude           latitude,
  longitude          longitude,
  srid               INTEGER REFERENCES spatial_ref_sys (srid),
  horizontalAccuracy ValDistanceType,
  magneticVariation  ValMagneticVariationType,
  geom               GEOMETRY(POINT, 4326)
);

--  https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_ElevatedPoint
CREATE TABLE ElevatedPoint
(
  id               INTEGER PRIMARY KEY REFERENCES Point (id) ON DELETE CASCADE ON UPDATE CASCADE,
  elevation        ValDistanceVerticalType,
  geoidUndulation  ValDistanceSignedType,
  verticalDatum    CodeVerticalDatumType,
  verticalAccuracy ValDistanceType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Curve
CREATE TABLE Curve
(
  id                 INTEGER PRIMARY KEY DEFAULT nextval('auto_id_curve'),
  latitude           latitude,
  longitude          longitude,
  coord              VARCHAR,
  srid               INTEGER REFERENCES spatial_ref_sys (srid),
  horizontalAccuracy ValDistanceType,
  geom               GEOMETRY(LINESTRING, 4326)
);

--  https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_ElevatedCurve
CREATE TABLE ElevatedCurve
(
  id               INTEGER PRIMARY KEY REFERENCES Curve (id) ON DELETE CASCADE ON UPDATE CASCADE,
  elevation        ValDistanceVerticalType,
  geoidUndulation  ValDistanceSignedType,
  verticalDatum    CodeVerticalDatumType,
  verticalAccuracy ValDistanceType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Surface
CREATE TABLE Surface
(
  id                 INTEGER PRIMARY KEY DEFAULT nextval('auto_id_surface'),
  horizontalAccuracy ValDistanceType,
  latitude           latitude,
  longitude          longitude,
  coord              VARCHAR,
  srid               INTEGER REFERENCES spatial_ref_sys (srid),
  geom               GEOMETRY(POLYGON, 4326)
);

--
--
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_ElevatedSurface
CREATE TABLE ElevatedSurface
(
  id               INTEGER NOT NULL PRIMARY KEY REFERENCES Surface (id),
  elevation        ValDistanceVerticalType,
  geoidUndulation  ValDistanceSignedType,
  verticalDatum    CodeVerticalDatumType,
  verticalAccuracy ValDistanceType
);
--  https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_City
CREATE TABLE City
(
  uuid      id PRIMARY KEY DEFAULT uuid_generate_v4(),
  name      TextNameType,
  note      VARCHAR
);
CREATE TABLE AirportHeliportCity
(
  uuidarphlp    id REFERENCES AirportHeliport (uuid),
  uuidCity      id REFERENCES City (uuid)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_SurveyControlPoint
CREATE TABLE SurveyControlPoint
(
  uuid          id PRIMARY KEY DEFAULT uuid_generate_v4()
);
CREATE TABLE SurveyControlPointTimeSlice
(
    idTimeSlice             INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                    id REFERENCES SurveyControlPoint (uuid),
    uuidarphlp              id REFERENCES AirportHeliport (uuid),
    idElevatedPoint         INTEGER NOT NULL REFERENCES Point (id) ON DELETE CASCADE ON UPDATE CASCADE,
    designator              TextNameType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AirportHotSpot
CREATE TABLE AirportHotSpot
(
  uuid                   id PRIMARY KEY DEFAULT uuid_generate_v4()
);
CREATE TABLE AirportHotSpotTimeSlice
(
    idTimeSlice             INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                    id REFERENCES AirportHotSpot (uuid),
    idElevatedSurface       INTEGER NOT NULL REFERENCES Surface (id),
    uuidarphlp              id REFERENCES AirportHeliport (uuid),
    designator              TextDesignatorType,
    instruction             TextInstructionType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

--https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Procedure
CREATE TABLE Procedure
(
    uuid                            id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                      VARCHAR(20)
);

CREATE TABLE SafeAltitudeArea
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                  VARCHAR(20)
);

CREATE TABLE ProcedureTransition
(
    id                 INTEGER PRIMARY KEY DEFAULT nextval('auto_id_curve'),
    flightTransition   id,
    _transasID         VARCHAR(20),
    transitionId       CodeDesignatedPointDesignatorType,
    type               CodeProcedurePhaseType,
    uuidProcedure      id,
    idcurve            INTEGER REFERENCES Curve (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE ProcedureTimeSlice
(
    idTimeSlice                         INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                                id REFERENCES Procedure (uuid),
    uuidarphlp                          id REFERENCES AirportHeliport (uuid),
    uuidsafealtitudearea                id REFERENCES SafeAltitudeArea (uuid),
    communicationFailureInstruction     TextInstructionType,
    instruction                         TextInstructionType,
    designCriteria                      CodeDesignStandardType,
    codingStandard                      CodeProcedureCodingStandardType,
    flightChecked                       CodeYesNoType,
    flightTransition                    id,
    name                                VARCHAR(60),
    rnav                                CodeYesNoType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

--  https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AltimeterSource
CREATE TABLE AltimeterSource
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4()
);
CREATE TABLE AltimeterSourceTimeSlice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY  DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES AltimeterSource (uuid),
    isRemote                    CodeYesNoType,
    isPrimary                   CodeYesNoType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE AltimeterSource_AirportHeliport
(
  uuidAltimeterSource       id REFERENCES AltimeterSource (uuid),
  uuidarphlp                id REFERENCES AirportHeliport (uuid)
);

--  https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AltimeterSourceStatus
CREATE TABLE AltimeterSourceStatus
(
  id                  INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('auto_id_altimeter_source_status'),
  uuidAltimeterSource id REFERENCES AltimeterSource (uuid),
  operationalStatus   CodeStatusOperationsType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_SurfaceContamination
CREATE TABLE SurfaceContamination
(
  id                    INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('auto_id_surface_contamination'),
  observationTime       DateTimeType,
  depth                 ValDepthType,
  frictionCoefficient   ValFrictionType,
  frictionEstimation    CodeFrictionEstimateType,
  frictionDevice        CodeFrictionDeviceType,
  obscuredLights        CodeYesNoType,
  furtherClearanceTime  TimeType,
  furtherTotalClearance CodeYesNoType,
  nextObservationTime   DateTimeType,
  proportion            ValPercentType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AirportHeliportContamination
CREATE TABLE AirportHeliportContamination
(
  id            INTEGER NOT NULL PRIMARY KEY REFERENCES SurfaceContamination (id),
  uuidarphlp    id REFERENCES AirportHeliport (uuid)
);


-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_RunwayContamination
CREATE TABLE RunwayContamination
(
  id                     INTEGER NOT NULL PRIMARY KEY REFERENCES SurfaceContamination (id),
  uuidRunway             id REFERENCES Runway (uuid),
  clearedLength          ValDistanceType,
  clearedWidth           ValDistanceType,
  clearedSide            CodeSideType,
  furtherClearanceLength ValDistanceType,
  furtherClearanceWidth  ValDistanceType,
  obscuredLightsSide     CodeSideType,
  clearedLengthBegin     ValDistanceType,
  taxiwayAvailable       CodeYesNoType,
  apronAvailable         CodeYesNoType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_RunwaySectionContamination
CREATE TABLE RunwaySectionContamination
(
  id         INTEGER NOT NULL PRIMARY KEY REFERENCES SurfaceContamination (id),
  uuidRunway id REFERENCES Runway (uuid),
  section    CodeRunwaySectionType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_GroundLightSystemhttps://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_GroundLightSystem
CREATE TABLE GroundLightSystem
(
    uuid                    id NOT NULL PRIMARY KEY DEFAULT uuid_generate_v4()
);
CREATE TABLE GroundLightSystemTimeslice
(
    idTimeSlice             INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                    id REFERENCES GroundLightSystem (uuid),
    emergencyLighting       CodeYesNoType,
    intensityLevel          CodeLightIntensityType,
    colour                  CodeColourType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);



-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_RunwayDirectionLightSystem
CREATE TABLE RunwayDirectionLightSystem
(
  uuid  id PRIMARY KEY REFERENCES GroundLightSystem (uuid) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE RunwayDirectionLightSystemTimeSlice
(
  idTimeSlice           INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
  uuid                  id REFERENCES RunwayDirectionLightSystem (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  uuidRunwayDirection   id REFERENCES RunwayDirection (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  position              CodeRunwaySectionType,
  constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_GroundLightingAvailability
CREATE TABLE GroundLightingAvailability
(
  id                    INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('auto_ground_lighting_availability'),
  uuidGroundLightSystem id REFERENCES GroundLightSystem (uuid),
  operationalStatus     CodeStatusOperationsType
);


-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Unit
CREATE TABLE Unit_Service
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4()
);


CREATE TABLE Unit_ServiceTimeSlice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES Unit_Service (uuid),
    name                        TextNameType,
    type                        CodeUnitType,
    compliantICAO               CodeYesNoType,
    designator                  CodeOrganisationDesignatorType,
    military                    CodeMilitaryOperationsType,
    idElevatedPoint             INTEGER REFERENCES ElevatedPoint (id) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidarphlp                  id REFERENCES AirportHeliport (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidOrganisationAuthority   id REFERENCES OrganisationAuthority (uuid),
    --- service
    flightOperations            CodeFlightDestinationType,
    rank                        CodeFacilityRankingType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_UnitDependency
CREATE TABLE UnitDependency
(
  id              INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('auto_id_unit_dependency'),
  uuidUnit        id REFERENCES Unit_Service (uuid),
  uuidRelatedUnit id REFERENCES Unit_Service (uuid),
  type            CodeUnitDependencyType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_CallsignDetail
CREATE TABLE CallsignDetail
(
  id          INTEGER PRIMARY KEY DEFAULT nextval('auto_id_callsign'),
  callSign    TextNameType,
  language    CodeLanguageType,
  uuidService id REFERENCES Unit_Service (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  translation VARCHAR
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_ContactInformation
CREATE TABLE ContactInformation
(
  id                        INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('auto_id_contact_information'),
  uuidarphlp                id REFERENCES AirportHeliport (uuid),
  uuidOrganisationAuthority id REFERENCES OrganisationAuthority (uuid),
  uuidUnit                  id REFERENCES Unit_Service (uuid),
  name                      TextNameType,
  title                     TextNameType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_PostalAddress
CREATE TABLE PostalAddress
(
  id                 INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('auto_id_postal_address'),
  deliveryPoint      TextAddressType,
  city               TextNameType,
  administrativeArea TextNameType,
  postalCode         TextNameType,
  country            TextNameType
);

CREATE TABLE ContactInformationPostalAddress
(
  idContactInformation INTEGER NOT NULL REFERENCES ContactInformation (id),
  idPostalAddress      INTEGER NOT NULL REFERENCES PostalAddress (id)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_OnlineContact
CREATE TABLE OnlineContact
(
  id       INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('auto_id_online_contact'),
  network  CodeTelecomNetworkType,
  linkage  TextAddressType,
  protocol TextNameType,
  eMail    TextAddressType
);

CREATE TABLE ContactInformationOnlineContact
(
  idContactInformation INTEGER NOT NULL REFERENCES ContactInformation (id),
  idOnlineContact      INTEGER NOT NULL REFERENCES OnlineContact (id)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_TelephoneContact
CREATE TABLE TelephoneContact
(
  id        INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('auto_id_telephone_contact'),
  voice     TextPhoneType,
  facsimile TextPhoneType
);

CREATE TABLE ContactInformationTelephoneContact
(
  idContactInformation INTEGER NOT NULL REFERENCES ContactInformation (id),
  idTelephoneContact   INTEGER NOT NULL REFERENCES TelephoneContact (id)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_RadioCommunicationChannel
CREATE TABLE RadioCommunicationChannel
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4()
);

CREATE TABLE RadioCommunicationChannelTimeSlice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES RadioCommunicationChannel (uuid),
    mode                        CodeCommunicationModeType,
    rank                        CodeFacilityRankingType,
    frequencyTransmission       ValFrequencyType,
    frequencyReception          ValFrequencyType,
    channel                     CodeCommunicationChannelType,
    logon                       TextDesignatorType,
    emissionType                CodeRadioEmissionType,
    selectiveCall               CodeYesNoType,
    flightChecked               CodeYesNoType,
    trafficDirection            CodeCommunicationDirectionType,
    idelevatedpoint             INTEGER unique DEFAULT nextval('auto_id_point'),
    elevation                   ValDistanceVerticalType,
    geoidUndulation             ValDistanceSignedType,
    verticalDatum               CodeVerticalDatumType,
    verticalAccuracy            ValDistanceType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE Service_RadioCommunicationChannel
(
  uuidService                   id REFERENCES Unit_Service (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  uuidRadioCommunicationChannel id REFERENCES RadioCommunicationChannel (uuid) ON DELETE CASCADE ON UPDATE CASCADE
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AirTrafficManagementService
CREATE TABLE AirTrafficManagementService
(
  uuid              id PRIMARY KEY REFERENCES Unit_Service (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  idTimeSlice       INTEGER NOT NULL UNIQUE REFERENCES Unit_ServiceTimeSlice (idTimeSlice),
  type              CodeServiceATFMType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AirportGroundService
CREATE TABLE AirportGroundService
(
    uuid            id PRIMARY KEY REFERENCES Unit_Service (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    idTimeSlice     INTEGER NOT NULL UNIQUE REFERENCES Unit_ServiceTimeSlice (idTimeSlice)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AircraftGroundService
CREATE TABLE AircraftGroundService
(
  idTimeSlice   INTEGER NOT NULL PRIMARY KEY REFERENCES AirportGroundService (idTimeSlice),
  uuid          id REFERENCES AirportGroundService (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  type          CodeAircraftGroundServiceType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_InformationService
CREATE TABLE InformationService
(
  uuid          id PRIMARY KEY REFERENCES Unit_Service (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  idTimeSlice   INTEGER NOT NULL UNIQUE REFERENCES Unit_ServiceTimeSlice (idTimeSlice),
  type          CodeServiceInformationType,
  voice         CodeYesNoType,
  dataLink      CodeYesNoType,
  recorded      CodeYesNoType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_SearchRescueService
CREATE TABLE SearchRescueService
(
    uuid            id PRIMARY KEY REFERENCES Unit_Service (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    idTimeSlice     INTEGER NOT NULL UNIQUE REFERENCES Unit_ServiceTimeSlice (idTimeSlice),
    type            CodeServiceSARType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_TrafficSeparationService
CREATE TABLE TrafficSeparationService
(
    uuid                id PRIMARY KEY REFERENCES Unit_Service (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    idTimeSlice         INTEGER NOT NULL UNIQUE REFERENCES Unit_ServiceTimeSlice (idTimeSlice),
    radarAssisted       CodeYesNoType,
    dataLinkEnabled     CodeYesNoType,
    dataLinkChannel     CodeCommunicationChannelType,
    type                VARCHAR
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AirTrafficControlService
CREATE TABLE AirTrafficControlService
(
    uuid            id PRIMARY KEY REFERENCES TrafficSeparationService (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    idTimeSlice     INTEGER NOT NULL UNIQUE REFERENCES TrafficSeparationService (idTimeSlice),
    type            CodeServiceATCType
);

-- https://extranet.eurocontrol.int/redirect/http://webprisme.cfmu.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_GroundTrafficControlService
CREATE TABLE GroundTrafficControlService
(
    uuid            id PRIMARY KEY REFERENCES TrafficSeparationService (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    idTimeSlice     INTEGER NOT NULL UNIQUE REFERENCES TrafficSeparationService (idTimeSlice),
    type            CodeServiceGroundControlType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_DesignatedPoint
CREATE TABLE DesignatedPoint
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                  VARCHAR(20)
);

CREATE TABLE DesignatedPointTimeslice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES DesignatedPoint (uuid),
    designator                  CodeDesignatedPointDesignatorType,
    type                        CodeDesignatedPointType,
    name                        TextNameType,
    idSignificantpoint          INTEGER DEFAULT nextval('auto_idSignificantpoint'),
    uuidarphlp                  id REFERENCES AirportHeliport (uuid),
    latitude                    latitude,
    longitude                   longitude,
    srid                        INTEGER REFERENCES spatial_ref_sys (srid),
    horizontalAccuracy          ValDistanceType,
    magneticVariation           ValMagneticVariationType,
    geom                        GEOMETRY(POINT, 4326),
    idelevatedpoint             INTEGER unique DEFAULT nextval('auto_id_point'),
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Route
CREATE TABLE Route
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                  VARCHAR(20)
);

CREATE TABLE RouteTimeslice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES Route (uuid),
    designatorPrefix            CodeRouteDesignatorPrefixType,
    designatorSecondLetter      CodeRouteDesignatorLetterType,
    designatorNumber            NoNumberType,
    multipleIdentifier          CodeUpperAlphaType,
    locationDesignator          TextDesignatorType,
    name                        TextNameType,
    type                        CodeRouteType,
    flightRule                  CodeFlightRuleType,
    internationalUse            CodeRouteOriginType,
    militaryUse                 CodeMilitaryStatusType,
    militaryTrainingType        CodeMilitaryTrainingType,
    uuidOrganisationAuthority   id REFERENCES OrganisationAuthority (uuid),
    country                     VARCHAR,
    ditrection                  VARCHAR,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Airspace
CREATE TABLE Airspace
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                  VARCHAR(20)
);

CREATE TABLE AirspaceTimeslice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES Airspace (uuid),
    translation                 VARCHAR,
    type                        CodeAirspaceType,
    designator                  CodeAirspaceDesignatorType,
    localType                   TextNameType,
    name                        TextNameType,
    designatorICAO              CodeYesNoType,
    controlType                 CodeMilitaryOperationsType,
    upperLowerSeparation        ValFLType,
    uuidRoute                   id REFERENCES Route (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    idSurface                   INTEGER UNIQUE DEFAULT nextval('auto_id_surface'),
    horizontalAccuracy          ValDistanceType,
    latitude                    latitude,
    longitude                   longitude,
    coord                       VARCHAR,
    srid                        INTEGER REFERENCES spatial_ref_sys (srid),
    geom                        GEOMETRY(POLYGON, 4326),
    id_AirspaceVolume           INTEGER UNIQUE DEFAULT nextval('auto_id_airspace_volume'),
    upperLimit                  ValDistanceVerticalType,
    upperLimitReference         CodeVerticalReferenceType,
    maximumLimit                ValDistanceVerticalType,
    maximumLimitReference       CodeVerticalReferenceType,
    lowerLimit                  ValDistanceVerticalType,
    lowerLimitReference         CodeVerticalReferenceType,
    minimumLimit                ValDistanceVerticalType,
    minimumLimitReference       CodeVerticalReferenceType,
    width                       ValDistanceType,
    upperIncludingValue         IncludingValueType,
    lowerIncludingValue         IncludingValueType,
    idCurve                     INTEGER UNIQUE DEFAULT nextval('auto_id_curve'),
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);



CREATE TABLE Airspace_Note
(
    idTimeSliceAirspc INTEGER REFERENCES AirspaceTimeslice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
    idNote            INTEGER REFERENCES Note (id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE Airspace_Service
(
    uuidairspc                      id REFERENCES Airspace (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidAirTrafficManagementService id REFERENCES AirTrafficManagementService (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidInformationService          id REFERENCES InformationService (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    --type                            VARCHAR, -- AirTrafficManagementService
    uuidAirTrafficControlService    id REFERENCES AirTrafficControlService (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidSearchRescueService         id REFERENCES SearchRescueService (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidGroundTrafficControlService id REFERENCES GroundTrafficControlService (uuid) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AirportHeliport_Service
(
    uuidarphlp                      id REFERENCES AirportHeliport (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidGroundTrafficControlService id REFERENCES GroundTrafficControlService (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidSearchRescueService         id REFERENCES SearchRescueService (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidAirTrafficControlService    id REFERENCES AirTrafficControlService (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidInformationService          id REFERENCES InformationService (uuid) ON DELETE CASCADE
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AirspaceActivation
CREATE TABLE AirspaceActivation
(
  id            INTEGER PRIMARY KEY REFERENCES PropertiesWithSchedule (id) ON DELETE CASCADE ON UPDATE CASCADE,
  activity      CodeAirspaceActivityType,
  status        CodeStatusAirspaceType,
  uuidairspc    id REFERENCES Airspace (uuid) ON DELETE CASCADE ON UPDATE CASCADE
);

-- http://aixm.aero/sites/aixm.aero/files/imce/AIXM511HTML/AIXM/Class_RadioCommunicationOperationalStatus.html
CREATE TABLE RadioCommunicationOperationalStatus
(
  id                    INTEGER PRIMARY KEY REFERENCES PropertiesWithSchedule (id) ON DELETE CASCADE ON UPDATE CASCADE,
  operationalStatus	    CodeStatusServiceType,
  uuidairspc            id REFERENCES Airspace (uuid) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE AirspaceActivation_OrganisationAuthority
(
  uuidOrganisationAuthority id REFERENCES OrganisationAuthority (uuid),
  idAirspaceActivation      INTEGER NOT NULL REFERENCES AirspaceActivation (id)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AirspaceLayerClass
CREATE TABLE AirspaceLayerClass
(
  id                INTEGER PRIMARY KEY DEFAULT nextval('auto_id_airspace_layer_class'),
  classification    CodeAirspaceClassificationType,
  uuidairspc        id REFERENCES Airspace (uuid)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AirspaceLayer
CREATE TABLE AirspaceLayer
(
  id                     INTEGER PRIMARY KEY DEFAULT nextval('auto_id_airspace_layer'),
  upperLimit             ValDistanceVerticalType,
  upperLimitReference    CodeVerticalReferenceType,
  lowerLimit             ValDistanceVerticalType,
  lowerLimitReference    CodeVerticalReferenceType,
  altitudeInterpretation CodeAltitudeUseType,
  idAirspaceLayerClass   INTEGER REFERENCES AirspaceLayerClass (id),
  idAirspaceActivation   INTEGER REFERENCES AirspaceActivation (id)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AirspaceVolume
CREATE TABLE AirspaceVolume
(
  uuidairspc            id REFERENCES Airspace (uuid) ON DELETE CASCADE ON UPDATE CASCADE
);
/*
-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_AuthorityForAirspace
CREATE TABLE AuthorityForAirspace
(
    uuid                            id PRIMARY KEY DEFAULT uuid_generate_v4(),
    idTimeSlice                     INTEGER UNIQUE DEFAULT nextval('auto_id_timeslice'),
    validTimeBegin                  DateType,
    validTimeEnd                    DateType,
    interpretation                  TimesliceInterpretationType,
    sequenceNumber                  NoNumberType,
    correctionNumber                NoNumberType,
    type                            CodeAuthorityType,
    uuidOrganisationAuthority       id REFERENCES OrganisationAuthority (uuid),
    uuidairspc                      id REFERENCES Airspace (uuid)
);
 */

-- https://skalolaskovy.ru/aviation-docs/144-tacan-frequencies
CREATE TABLE channel_frequency_pair
(
  id                SERIAL PRIMARY KEY,
  channel           CodeTACANChannelType,
  vor_fr            numeric(8, 2),
  loc_fr            numeric(8, 2),
  glideslope_fr     numeric(8, 2)
);

CREATE TABLE RunwayCentrelinePoint
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                  VARCHAR(20)
);


CREATE TABLE RunwayCentrelinePointTimeslice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES RunwayCentrelinePoint (uuid),
    --name                        TextNameType,
    role                        CodeRunwayPointRoleType,
    designator                  TextDesignatorType,
    --idNote                      INTEGER REFERENCES Note (id)
    idElevatedPoint             INTEGER UNIQUE DEFAULT nextval('auto_id_point'),
    idNavaidEquipment           id REFERENCES NavaidEquipment (uuid),
    idSignificantpoint          INTEGER DEFAULT nextval('auto_idSignificantpoint'),
    uuidRunwayDirection         id REFERENCES RunwayDirection (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    elevation                   ValDistanceVerticalType,
    geoidUndulation             ValDistanceSignedType,
    verticalDatum               CodeVerticalDatumType,
    verticalAccuracy            ValDistanceType,
    latitude                    latitude,
    longitude                   longitude,
    srid                        INTEGER REFERENCES spatial_ref_sys (srid),
    horizontalAccuracy          ValDistanceType,
    magneticVariation           ValMagneticVariationType,
    geom                        GEOMETRY(POINT, 4326),
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);
-- Significant Point - это выбор между точками РНС, аэродромами, центральными точками ВПП, назначенными точками (ППМ, Designated Point) и точками взлета-посадки
--


-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_SegmentPoint
CREATE TABLE SegmentPoint
(
  id                        INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('auto_id_segment_point'), --- idEnRouteSegmentPoint
  reportingATC              CodeATCReportingType,
  flyOver                   CodeYesNoType,
  waypoint                  CodeYesNoType,
  radarGuidance             CodeYesNoType,
  idSignificantPoint        INTEGER NOT NULL,
  isEnRouteSegmentPoint     BOOLEAN,
  roleFreeFlight            CodeFreeFlightType,
  roleRVSM                  CodeRVSMPointRoleType,
  turnRadius                ValDistanceType,
  roleMilitaryTraining      CodeMilitaryRoutePointType,
  isTerminalSegmentPoint    BOOLEAN,
  role	                    CodeProcedureFixRoleType,
  leadRadial	            ValBearingType,
  leadDME     	            ValDistanceType,
  indicatorFACF	            CodeYesNoType,
  idNote                    INTEGER REFERENCES Note (id),
  idHoldingPattern          id REFERENCES HoldingPattern (uuid) ON DELETE CASCADE ON UPDATE CASCADE
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_RouteSegment
CREATE TABLE RouteSegment
(
    uuid                                            id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                                      VARCHAR(20)
);

CREATE TABLE RouteSegmentTimeslice
(
    idTimeSlice                                     INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                                            id REFERENCES RouteSegment (uuid),
    level                                           CodeLevelType,
    upperLimit                                      ValDistanceVerticalType,
    upperLimitReference                             CodeVerticalReferenceType,
    lowerLimit                                      ValDistanceVerticalType,
    lowerLimitReference                             CodeVerticalReferenceType,
    upperIncludingValue                             IncludingValueType,
    lowerIncludingValue                             IncludingValueType,
    minimumObstacleClearanceAltitude                ValDistanceVerticalType,
    minimumObstacleClearanceAltitudeReference       CodeVerticalReferenceType,
    pathType                                        CodeRouteSegmentPathType,
    trueTrack                                       ValBearingType,
    magneticTrack                                   ValBearingType,
    reverseTrueTrack                                ValBearingType,
    reverseMagneticTrack                            ValBearingType,
    length                                          ValDistanceType,
    widthLeft                                       ValDistanceType,
    widthRight                                      ValDistanceType,
    turnDirection                                   CodeDirectionTurnType,
    signalGap                                       CodeYesNoType,
    minimumEnrouteAltitude                          ValDistanceVerticalType,
    minimumEnrouteAltitudeReference                 CodeVerticalReferenceType,
    minimumCrossingAtEnd                            ValDistanceVerticalType,
    minimumCrossingAtEndReference                   CodeVerticalReferenceType,
    maximumCrossingAtEnd                            ValDistanceVerticalType,
    maximumCrossingAtEndReference                   CodeVerticalReferenceType,
    navigationType                                  CodeRouteNavigationType,
    requiredNavigationPerformance                   CodeRNPType,
    designatorSuffix                                CodeRouteDesignatorSuffixType,
    uuidRoute                                       id REFERENCES Route (uuid),
    ---idCurve                                   INTEGER REFERENCES Curve (id) ON DELETE CASCADE ON UPDATE CASCADE,
    idEnRouteSegmentPointStart                      INTEGER, ---REFERENCES EnRouteSegmentPoint (id) ON DELETE CASCADE ON UPDATE CASCADE,
    idEnRouteSegmentPointEnd                        INTEGER, ---REFERENCES EnRouteSegmentPoint (id) ON DELETE CASCADE ON UPDATE CASCADE
    idPointStart                                    INTEGER,
    idPointEnd                                      INTEGER,
    idCurve                                         INTEGER UNIQUE DEFAULT nextval('auto_id_curve'),
    latitude                                        latitude,
    longitude                                       longitude,
    coord                                           VARCHAR,
    srid                                            INTEGER REFERENCES spatial_ref_sys (srid),
    horizontalAccuracy                              ValDistanceType,
    geom                                            GEOMETRY(LINESTRING, 4326),
    idPropertiesWithSchedule                        INTEGER UNIQUE DEFAULT nextval('auto_id_properties_with_schedule'),
    direction                                       CodeDirectionType,
    cardinalDirection                               CodeCardinalDirectionType,
    status                                          CodeRouteAvailabilityType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE RouteSegment_Note
(
    idTimeSliceRtSeg INTEGER REFERENCES RouteSegmentTimeslice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
    idNote           INTEGER REFERENCES Note (id)
);


-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_RoutePortion
CREATE TABLE RoutePortion
(
  id                             INTEGER NOT NULL PRIMARY KEY DEFAULT nextval('auto_id_route_portion'),
  idSignificantPointStart        INTEGER NOT NULL,
  idSignificantPointIntermediate INTEGER NOT NULL,
  idSignificantPointEnd          INTEGER NOT NULL
);


-- связь многие-ко-многим, поэтому добавляем связующую таблицу:
CREATE TABLE Navaid_NavaidEquipment
(
  uuidNavaid          id REFERENCES Navaid (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  uuidNavaidEquipment id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Azimuth
CREATE TABLE Azimuth
(
  idTimeSlice INTEGER NOT NULL PRIMARY KEY REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
  uuid                      id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  type                      CodeMLSAzimuthType,
  trueBearing               ValBearingType,
  trueBearingAccuracy       ValAngleType,
  magneticBearing           ValBearingType,
  angleProportionalLeft     ValAngleType,
  angleProportionalRight    ValAngleType,
  angleCoverLeft            ValAngleType,
  angleCoverRight           ValAngleType,
  channel                   CodeMLSChannelType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_DME
CREATE TABLE DME
(
  id             serial PRIMARY KEY,
  idTimeSlice    INTEGER NOT NULL REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
  uuid           id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  type           CodeDMEType,
  channel        CodeDMEChannelType,
  ghostFrequency ValFrequencyType,
  displace       ValDistanceType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_DirectionFinder
CREATE TABLE DirectionFinder
(
  idTimeSlice   INTEGER NOT NULL PRIMARY KEY REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
  uuid          id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  doppler       CodeYesNoType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Elevation
CREATE TABLE Elevation
(
  idTimeSlice   INTEGER NOT NULL PRIMARY KEY REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
  uuid          id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  angleNominal  ValAngleType,
  angleMinimum  ValAngleType,
  angleSpan     ValAngleType,
  angleAccuracy ValAngleType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Glidepath
CREATE TABLE Glidepath
(
  id            serial PRIMARY KEY,
  idTimeSlice   INTEGER NOT NULL REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
  uuid          id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  frequency     ValFrequencyType,
  slope         ValAngleType,
  angleAccuracy ValAngleType,
  rdh           ValDistanceVerticalType,
  rdhAccuracy   ValDistanceVerticalType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_Localizer
CREATE TABLE Localizer
(
  id                        serial PRIMARY KEY,
  idTimeSlice               INTEGER NOT NULL REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
  uuid                      id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  frequency                 ValFrequencyType,
  magneticBearing           ValBearingType,
  magneticBearingAccuracy   ValAngleType,
  trueBearing               ValBearingType,
  trueBearingAccuracy       ValAngleType,
  declination               ValMagneticVariationType,
  widthCourse               ValAngleType,
  widthCourseAccuracy       ValAngleType,
  backCourseUsable          CodeILSBackCourseType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_NDB
CREATE TABLE NDB
(
  id            serial PRIMARY KEY,
  idTimeSlice   INTEGER NOT NULL REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
  uuid          id NOT NULL REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  frequency     ValFrequencyType,
  class         CodeNDBUsageType,
  emissionBand  CodeEmissionBandType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_SDF
CREATE TABLE SDF
(
  id                serial PRIMARY KEY,
  idTimeSlice       INTEGER NOT NULL REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
  uuid              id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  frequency         ValFrequencyType,
  magneticBearing   ValBearingType,
  trueBearing       ValBearingType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_TACAN
CREATE TABLE TACAN
(
  id          serial PRIMARY KEY,
  idTimeSlice INTEGER NOT NULL REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
  uuid        id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  channel     CodeTACANChannelType,
  declination ValMagneticVariationType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_VOR
CREATE TABLE VOR
(
  id                    serial PRIMARY KEY,
  idTimeSlice           INTEGER NOT NULL REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
  uuid                  id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
  type                  CodeVORType,
  frequency             ValFrequencyType,
  zeroBearingDirection  CodeNorthReferenceType,
  declination           ValMagneticVariationType
);

CREATE TABLE RSNN
(
    id          serial PRIMARY KEY,
    idTimeSlice INTEGER NOT NULL REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
    uuid        id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    channel     INT
);


CREATE TABLE GroundBasedAugmentationSystem
(
    id          serial PRIMARY KEY,
    idTimeSlice INTEGER NOT NULL REFERENCES NavaidEquipmentTimeSlice (idTimeSlice) ON DELETE CASCADE ON UPDATE CASCADE,
    uuid        id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    channel     INT,
    frequency   ValFrequencyType
);


-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_ObstacleArea
CREATE TABLE ObstacleArea
(
    uuid                            id PRIMARY KEY DEFAULT uuid_generate_v4()
);
CREATE TABLE ObstacleAreaTimeSlice
(
    idTimeSlice                     INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                            id REFERENCES ObstacleArea (uuid),
    validTimeBegin                  DateType,
    validTimeEnd                    DateType,
    interpretation                  TimesliceInterpretationType,
    sequenceNumber                  NoNumberType,
    correctionNumber                NoNumberType,
    type                            CodeObstacleAreaType,
    obstructionIdSurfaceCondition   CodeObstacleAssessmentSurfaceType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_VerticalStructure
CREATE TABLE VerticalStructure
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                  VARCHAR(20)
);

CREATE TABLE VerticalStructureTimeslice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES VerticalStructure (uuid),
    name                        TextNameType,
    type                        CodeVerticalStructureType,
    lighted                     CodeYesNoType,
    markingICAOStandard         CodeYesNoType,
    "group"                     CodeYesNoType,
    length                      ValDistanceType,
    width                       ValDistanceType,
    radius                      ValDistanceType,
    lightingICAOStandard        CodeYesNoType,
    synchronisedLighting        CodeYesNoType,
    translation                 VARCHAR,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE ObstacleArea_VerticalStructure
(
  uuidObstacleArea      id PRIMARY KEY REFERENCES ObstacleArea,
  uuidVerticalStructure id REFERENCES VerticalStructure
);
CREATE TABLE GroundLightSystem_VerticalStructure
(
  uuidGroundLightSystem id PRIMARY KEY REFERENCES GroundLightSystem,
  uuidVerticalStructure id REFERENCES VerticalStructure
);
CREATE TABLE NavaidEquipment_VerticalStructure
(
  uuidNavaidEquipment   id PRIMARY KEY REFERENCES NavaidEquipment,
  uuidVerticalStructure id REFERENCES VerticalStructure
);
CREATE TABLE OrganisationAuthority_VerticalStructure
(
  uuidOrganisationAuthority id PRIMARY KEY REFERENCES OrganisationAuthority,
  uuidVerticalStructure     id REFERENCES VerticalStructure
);
CREATE TABLE Unit_VerticalStructure
(
  uuidUnit              id PRIMARY KEY REFERENCES Unit_Service,
  uuidVerticalStructure id REFERENCES VerticalStructure
);
CREATE TABLE Service_VerticalStructure
(
  uuidService           id PRIMARY KEY REFERENCES Unit_Service,
  uuidVerticalStructure id REFERENCES VerticalStructure
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_MarkerBeacon
CREATE TABLE MarkerBeacon
(
    id                    serial PRIMARY KEY,
    idTimeSlice           INTEGER NOT NULL REFERENCES NavaidEquipmentTimeslice (idTimeSlice),
    uuid                  id REFERENCES NavaidEquipment (uuid) ON DELETE CASCADE ON UPDATE CASCADE,
    class                 CodeMarkerBeaconSignalType,
    frequency             ValFrequencyType,
    axisBearing           ValBearingType,
    auralMorseCode        CodeAuralMorseType,
    uuidVerticalStructure id REFERENCES VerticalStructure
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_VerticalStructurePart
CREATE TABLE VerticalStructurePart
(
    id                        INTEGER PRIMARY KEY DEFAULT nextval('auto_id_properties_with_schedule'),
    verticalExtent            ValDistanceType,
    verticalExtentAccuracy    ValDistanceType,
    type                      CodeVerticalStructureType,
    constructionStatus        CodeStatusConstructionType,
    markingPattern            CodeVerticalStructureMarkingType,
    markingFirstColour        CodeColourType,
    markingSecondColour       CodeColourType,
    mobile                    CodeYesNoType,
    frangible                 CodeYesNoType,
    visibleMaterial           CodeVerticalStructureMaterialType,
    designator                TextDesignatorType,
    uuidVerticalStructure     id REFERENCES VerticalStructure,
    latitude                  latitude,
    longitude                 longitude,
    srid                      INTEGER REFERENCES spatial_ref_sys (srid),
    horizontalAccuracy        ValDistanceType,
    magneticVariation         ValMagneticVariationType,
    geom                      GEOMETRY(POINT, 4326),
    elevation                 ValDistanceVerticalType,
    geoidUndulation           ValDistanceSignedType,
    verticalDatum             CodeVerticalDatumType,
    verticalAccuracy          ValDistanceType
);

-- https://ext.eurocontrol.int/aixmwiki_public/bin/view/AIXM/Class_VerticalStructurePartGeometry
CREATE TABLE VerticalStructurePartGeometry
(
    idVerticalStructurePart INTEGER PRIMARY KEY REFERENCES VerticalStructurePart ON DELETE CASCADE ON UPDATE CASCADE,
    idElevatedPoint         INTEGER REFERENCES ElevatedPoint (id) ON DELETE CASCADE ON UPDATE CASCADE,
    idElevatedCurve         INTEGER REFERENCES ElevatedCurve (id) ON DELETE CASCADE ON UPDATE CASCADE,
    idElevatedSurface       INTEGER REFERENCES ElevatedSurface (id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE PointReference
(
    role	                CodeReferenceRoleType,
    id                      INTEGER PRIMARY KEY DEFAULT nextval('auto_id_curve'),
    alongCourseGuidance 	CodeYesNoType,
    uuidanglind             id,
    uuiddistind             id,
    idSegmentPoint          INTEGER REFERENCES SegmentPoint (id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE AngleIndication
(
    uuid                    id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID              VARCHAR(50)
);

CREATE TABLE AngleIndicationTimeSlice
(
    idTimeSlice             INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                    id REFERENCES AngleIndication (uuid),
    angle                   ValBearingType,
    angleType               CodeBearingType,
    interpretation          TimesliceInterpretationType,
    idSignificantPoint      INTEGER,
    pointChoice_uuid        id REFERENCES Navaid (uuid)
);

CREATE TABLE DistanceIndication
(
    uuid                    id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID              VARCHAR(50)
);

CREATE TABLE DistanceIndicationTimeSlice
(
    idTimeSlice             INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                    id REFERENCES DistanceIndication (uuid),
    distance                ValDistanceType,
    type                    CodeDistanceIndicationType,
    interpretation          TimesliceInterpretationType,
    idSignificantPoint      INTEGER,
    pointChoice_uuid        id REFERENCES Navaid (uuid)
);


CREATE TABLE InstrumentApproachProcedure
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4()
);

CREATE TABLE InstrumentApproachProcedureTimeslice
(

    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES InstrumentApproachProcedure (uuid),
    approachPrefix              CodeApproachPrefixType,
    approachType                CodeApproachType,
    multipleIdentification  	CodeUpperAlphaType,
    copterTrack 	            ValBearingType,
    circlingIdentification      CodeUpperAlphaType,
    courseReversalInstruction   TextInstructionType,
    additionalEquipment         CodeApproachEquipmentAdditionalType,
    channelGNSS 	            ValChannelNumberType,
    WAASReliable                CodeYesNoType,
    idLanding                   INTEGER UNIQUE DEFAULT nextval('auto_id_Landing'),
    isLocatedAt                 uuid,
    idFinalProfile              INTEGER,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE AngleUse
(
    alongCourseGuidance 	CodeYesNoType,
    idPointReference        INTEGER NOT NULL REFERENCES PointReference (id) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidanglind             id
);
CREATE TABLE SegmentLeg
(
    uuid                    id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID              VARCHAR(20)
);

CREATE TABLE SegmentLegTimeslice
(
    idTimeSlice             INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                    id REFERENCES SegmentLeg (uuid),
    endConditionDesignator  CodeSegmentTerminationType,
    legPath                 CodeTrajectoryType,
    legTypeARINC            CodeSegmentPathType,
    course                  ValBearingType,
    courseType              CodeCourseType,
    verticalAngle           ValAngleType,
    courseDirection         CodeDirectionReferenceType,
    turnDirection           CodeDirectionTurnType,
    speedLimit              ValSpeedType,
    speedReference          CodeSpeedReferenceType,
    length                  ValDistanceType,
    duration                ValDurationType,
    procedureTurnRequired   CodeYesNoType,
    upperLimitAltitude      ValDistanceVerticalType,
    upperLimitReference     CodeVerticalReferenceType,
    lowerLimitAltitude      ValDistanceVerticalType,
    lowerLimitReference     CodeVerticalReferenceType,
    altitudeInterpretation  CodeAltitudeUseType,
    idCurve                 INTEGER UNIQUE DEFAULT nextval('auto_id_curve'),
    latitude                latitude,
    longitude               longitude,
    coord                   VARCHAR,
    srid                    INTEGER REFERENCES spatial_ref_sys (srid),
    horizontalAccuracy      ValDistanceType,
    geom                    GEOMETRY(LINESTRING, 4326),
    idStart                 INTEGER REFERENCES SegmentPoint (id) ON DELETE CASCADE ON UPDATE CASCADE,
    idArcCentre             INTEGER REFERENCES SegmentPoint (id) ON DELETE CASCADE ON UPDATE CASCADE,
    idEnd                   INTEGER REFERENCES SegmentPoint (id) ON DELETE CASCADE ON UPDATE CASCADE,
    distance                uuid,
    angle                   uuid,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE ProcedureTransitionLeg
(
    idProcedureTransition   INTEGER REFERENCES ProcedureTransition (id) ON DELETE CASCADE ON UPDATE CASCADE,
    uuidSegmentLeg          id,
    seqNumberARINC          NoSequenceBaseType
);
CREATE TABLE ApproachLeg
(
    uuid                    id PRIMARY KEY DEFAULT uuid_generate_v4(),
    idTimeSlice             INTEGER NOT NULL UNIQUE REFERENCES SegmentLegTimeslice (idTimeSlice),
    uuidInstrumentApproach  id,
    uuidSpecialization      id
);
CREATE TABLE MissedApproachLeg
(
    id                      serial PRIMARY KEY,
    uuid                    id DEFAULT uuid_generate_v4(),
    idTimeSlice             INTEGER NOT NULL UNIQUE REFERENCES SegmentLegTimeslice (idTimeSlice),
    type                    CodeMissedApproachType,
    thresholdAfterMAPT  	CodeYesNoType,
    heightMAPT  	        ValDistanceVerticalType,
    uuidSpecialization      id
);
CREATE TABLE DepartureLeg
(
    id                      serial PRIMARY KEY,
    uuid                    id DEFAULT uuid_generate_v4(),
    idTimeSlice             INTEGER NOT NULL UNIQUE REFERENCES SegmentLegTimeslice (idTimeSlice),
    uuidSpecialization      id
);
CREATE TABLE StandardInstrumentDeparture
(
    uuid                    id PRIMARY KEY DEFAULT uuid_generate_v4()
);

CREATE TABLE StandardInstrumentDepartureTimeslice
(
    idTimeSlice             INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                    id REFERENCES StandardInstrumentDeparture (uuid),
    designator  	        TextSIDSTARDesignatorType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE PointReferenceDistanceIndication
(
    idPointReference        INTEGER NOT NULL REFERENCES PointReference (id) ON DELETE CASCADE ON UPDATE CASCADE,
    uuiddistind             id
);
CREATE TABLE SegmentPointReference
(
    idSegmentPoint      INTEGER REFERENCES SegmentPoint (id) ON DELETE CASCADE ON UPDATE CASCADE,
    idPointReference    INTEGER REFERENCES PointReference (id) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE AircraftCharacteristic
(
    aircraftLandingCategory     CodeAircraftCategoryType,
    uuidSegmentLeg              id REFERENCES SegmentLeg (uuid) ON DELETE CASCADE ON UPDATE CASCADE
);
CREATE TABLE ArrivalLeg
(
    id                      serial PRIMARY KEY,
    uuid                    id DEFAULT uuid_generate_v4(),
    idTimeSlice             INTEGER NOT NULL UNIQUE REFERENCES SegmentLegTimeslice (idTimeSlice),
    uuidSpecialization      id
);
CREATE TABLE InitialLeg
(
    id                      serial PRIMARY KEY,
    uuid                    id DEFAULT uuid_generate_v4(),
    idTimeSlice             INTEGER NOT NULL UNIQUE REFERENCES SegmentLegTimeslice (idTimeSlice),
    uuidSpecialization      id
);
CREATE TABLE FinalLeg
(
    id                      serial PRIMARY KEY,
    uuid                    id DEFAULT uuid_generate_v4(),
    idTimeSlice             INTEGER NOT NULL UNIQUE REFERENCES SegmentLegTimeslice (idTimeSlice),
    uuidSpecialization      id
);
CREATE TABLE StandardInstrumentArrival
(
    uuid                id PRIMARY KEY DEFAULT uuid_generate_v4()
);

CREATE TABLE StandardInstrumentArrivalTimeslice
(
    idTimeSlice         INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                id REFERENCES StandardInstrumentArrival (uuid),
    designator          TextSIDSTARDesignatorType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);
CREATE TABLE SpecialNavigationSystem
(
    uuid            id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID      VARCHAR(20),
    type            CodeSpecialNavigationSystemType
);

CREATE TABLE SpecialNavigationStation
(
    uuid                    id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID              VARCHAR(20)
);

CREATE TABLE SpecialNavigationStationTimeslice
(
    idTimeSlice             INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                    id REFERENCES SpecialNavigationStation (uuid),
    idElevatedPoint         INTEGER UNIQUE DEFAULT nextval('auto_id_point'),
    elevation               ValDistanceVerticalType,
    geoidUndulation         ValDistanceSignedType,
    verticalDatum           CodeVerticalDatumType,
    verticalAccuracy        ValDistanceType,
    -- point
    latitude                latitude,
    longitude               longitude,
    srid                    INTEGER REFERENCES spatial_ref_sys (srid),
    horizontalAccuracy      ValDistanceType,
    magneticVariation       ValMagneticVariationType,
    geom                    GEOMETRY(POINT, 4326),
    uuidSystemChain         id, ---REFERENCES SpecialNavigationSystem (uuid) ON DELETE CASCADE ON UPDATE CASCADEб
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);

CREATE TABLE BigOrgData
(
    uuidOrganisationAuthority   id PRIMARY KEY DEFAULT uuid_generate_v4()
);

CREATE TABLE BigOrgDataTimeslice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuidOrganisationAuthority   id REFERENCES BigOrgData (uuidOrganisationAuthority),
    name                        TextNameType,
    designator                  CodeOrganisationDesignatorType,
    type                        CodeOrganisationType,
    military                    CodeMilitaryOperationsType,
    AuthorityType               CodeAuthorityType,
    uuidairspc                  id REFERENCES Airspace (uuid),
    idContact                   INTEGER NOT NULL UNIQUE DEFAULT nextval('auto_id_contact_information'),
    uuidarphlp                  id REFERENCES AirportHeliport (uuid),
    uuidUnit                    id REFERENCES Unit_Service (uuid),
    contactName                 TextNameType,
    title                       TextNameType,
    idProperties                INTEGER UNIQUE DEFAULT nextval('auto_id_properties_with_schedule'),
    idPostalAddress             INTEGER NOT NULL UNIQUE DEFAULT nextval('auto_id_postal_address'),
    deliveryPoint               TextAddressType,
    city                        TextNameType,
    administrativeArea          TextNameType,
    postalCode                  TextNameType,
    country                     TextNameType,
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);




CREATE TABLE SafeAltitudeAreaTimeslice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES SafeAltitudeArea (uuid),
    safeAreaType 	            CodeSafeAltitudeType,
    --- idSignificantpoint 	        INTEGER UNIQUE NOT NULL,
    --- uuidSafeAltitudeAreaSector    INTEGER,
    uuidarphlp                  id REFERENCES AirportHeliport (uuid),
    location                    id REFERENCES AirportHeliport (uuid),
    centrePoint_arp             id REFERENCES AirportHeliport (uuid),
    centrePoint_nav             id REFERENCES Navaid (uuid),
    idNote                      INTEGER REFERENCES Note (id),
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);


CREATE TABLE SafeAltitudeAreaSector
(
    uuid                        id PRIMARY KEY DEFAULT uuid_generate_v4(),
    _transasID                  VARCHAR(20)
);

CREATE TABLE SafeAltitudeAreaSectorTimeslice
(
    idTimeSlice                 INTEGER UNIQUE PRIMARY KEY DEFAULT nextval('auto_id_timeslice'),
    uuid                        id REFERENCES SafeAltitudeAreaSector (uuid),
    bufferWidth 	            ValDistanceType,
    idSurface 	                INTEGER UNIQUE DEFAULT nextval('auto_id_surface'),
    horizontalAccuracy          ValDistanceType,
    latitude                    latitude,
    longitude                   longitude,
    coord                       VARCHAR,
    srid                        INTEGER REFERENCES spatial_ref_sys (srid),
    geom                        GEOMETRY,
    -- isResolvedBy  	        Obstruction
    -- isDefinedBy CircleSector
    arcDirection 	            CodeArcDirectionType,
    fromAngle 	                ValBearingType,
    toAngle 	                ValBearingType,
    angleType 	                CodeBearingType,
    angleDirectionReference 	CodeDirectionReferenceType,
    innerDistance 	            ValDistanceType,
    outerDistance 	            ValDistanceType,
    upperLimit 	                ValDistanceVerticalType,
    upperLimitReference 	    CodeVerticalReferenceType,
    lowerLimit 	                ValDistanceVerticalType,
    lowerLimitReference 	    CodeVerticalReferenceType,
    idNote                      INTEGER REFERENCES Note (id),
    uuidSafeAltitudeArea        id REFERENCES SafeAltitudeArea (uuid),
    constraint timeslice_ref FOREIGN KEY (idTimeSlice) REFERENCES timeslice (idTimeSlice)
);
