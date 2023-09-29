from sqlalchemy_utils import CompositeType
from sqlalchemy import Column, String, Float, Integer


DistanceVerticalType =(
    CompositeType(
        "distance_vertical_type",
        [
            Column("value", Float, nullable=True),
            Column("nonNumeric", String, nullable=True),
            Column("unit", String, nullable=True),
            Column("nilReason", String, nullable=True)
        ]
    )
)

DistanceType = (
    CompositeType(
        "distance_type",
        [
            Column("value", Float, nullable=True),
            Column("unit", String, nullable=True),
            Column("nilReason", String, nullable=True)
        ]
    )
)

CodeYesNoType = (
    CompositeType(
        "code_yes_no_type",
        [
            Column("value", String, nullable=True),
            Column("nilReason", String, nullable=True)
        ]
    )
)


TemperatureType = (
    CompositeType(
        "temperature_type",
        [
            Column("value", Float, nullable=True),
            Column("unit", String, nullable=True)
        ]
    )
)

FlType = (
    CompositeType(
        "fl_type",
        [
            Column("value", Integer, nullable=True),
            Column("unit", String, nullable=True)
        ]
    )
)

ValFrequencyType = (
    CompositeType(
        "valfrequencytype",
        [
            Column("value", Float, nullable=True),
            Column("unit", String, nullable=True)
        ]
    )
)

ValDistanceVerticalType = (
    CompositeType(
        "valdistanceverticaltype",
        [
            Column("value", Float, nullable=True),
            Column("nonNumeric", String, nullable=True),
            Column("unit", String, nullable=True),
            Column("nilReason", String, nullable=True)
        ]
    )
)

ValDistanceSignedType = (
    CompositeType(
        "valdistancesignedtype",
        [
            Column("value", Float, nullable=True),
            Column("unit", String, nullable=True),
        ]
    )
)

ValDistanceType = (
    CompositeType(
        "valdistancetype",
        [
            Column("value", Float, nullable=True),
            Column("unit", String, nullable=True),
            Column("nilReason", String, nullable=True)
        ]
    )
)
