from uuid import UUID as _py_uuid
from datetime import datetime
from sqlalchemy import ForeignKey, Identity, Column, Integer, String, Float, DateTime
from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy.dialects.postgresql import UUID
from geoalchemy2 import Geometry
from sqlalchemy_utils import CompositeType
from database.models.Base import Base
from database.models.CompositeTypes import DistanceVerticalType, DistanceType, CodeYesNoType, TemperatureType, FlType


class AirportHeliportTimeSlice(Base):

    __tablename__ = "11airportheliporttimeSlice"

    idtimeslice: Mapped[int] = mapped_column(ForeignKey("11timeslice.idtimeslice"), primary_key=True, nullable=False)
    uuid: Mapped[_py_uuid] = mapped_column(UUID(as_uuid=True), ForeignKey("11airportheliport.uuid"), nullable=False)
    latitude: Mapped[float] = mapped_column(Float, nullable=True)
    longitude: Mapped[float] = mapped_column(Float, nullable=True)
    srid: Mapped[str] = mapped_column(Integer, nullable=True)
    geom = Column(Geometry, nullable=True)
    elevation: Mapped[CompositeType] = mapped_column(DistanceVerticalType, nullable=True)
    geoidundulation: Mapped[float] = mapped_column(Float, nullable=True)
    verticaldatum: Mapped[str] = mapped_column(String, nullable=True)
    verticalaccuracy: Mapped[CompositeType] = mapped_column(DistanceVerticalType, nullable=True)
    translation: Mapped[str] = mapped_column(String, nullable=True)
    designator: Mapped[str] = mapped_column(String, nullable=True)
    designatoriata: Mapped[str] = mapped_column(String, nullable=True)
    name: Mapped[str] = mapped_column(String, nullable=True)
    locationindicatoricao: Mapped[str] = mapped_column(String, nullable=True)
    type: Mapped[str] = mapped_column(String, nullable=True)
    controltype: Mapped[str] = mapped_column(String, nullable=True)
    abandoned: Mapped[CompositeType] = mapped_column(CodeYesNoType, nullable=True)
    lighting_: Mapped[str] = mapped_column(String, nullable=True)
    source_: Mapped[str] = mapped_column(String, nullable=True)
    flight_rules_: Mapped[str] = mapped_column(String, nullable=True)
    aip_: Mapped[str] = mapped_column(String, nullable=True)
    idpropertieswithschedule: Mapped[int] = mapped_column(Identity(start=1, cycle=True))
    operationalstatus: Mapped[str] = mapped_column(String, nullable=True)
    certifiedicao: Mapped[CompositeType] = mapped_column(CodeYesNoType, nullable=True)
    privateuse: Mapped[CompositeType] = mapped_column(CodeYesNoType, nullable=True)
    fieldelevation: Mapped[CompositeType] = mapped_column(DistanceVerticalType, nullable=True)
    fieldelevationaccuracy: Mapped[CompositeType] = mapped_column(DistanceVerticalType, nullable=True)
    magneticvariation: Mapped[float] = mapped_column(Float, nullable=True)
    magneticvariationaccuracy: Mapped[float] = mapped_column(Float, nullable=True)
    datemagneticvariation: Mapped[int] = mapped_column(Integer, nullable=True)
    magneticvariationchange: Mapped[float] = mapped_column(Float, nullable=True)
    referencetemperature: Mapped[CompositeType] = mapped_column(TemperatureType, nullable=True)
    altimeterchecklocation: Mapped[CompositeType] = mapped_column(CodeYesNoType, nullable=True)
    secondarypowersupply: Mapped[CompositeType] = mapped_column(CodeYesNoType, nullable=True)
    winddirectionindicator: Mapped[CompositeType] = mapped_column(CodeYesNoType, nullable=True)
    landingdirectionindicator: Mapped[CompositeType] = mapped_column(CodeYesNoType, nullable=True)
    transitionaltitude: Mapped[CompositeType] = mapped_column(DistanceVerticalType, nullable=True)
    transitionlevel: Mapped[CompositeType] = mapped_column(FlType, nullable=True)
    lowesttemperature: Mapped[CompositeType] = mapped_column(TemperatureType, nullable=True)
    certificationdate: Mapped[datetime] = mapped_column(DateTime, nullable=True)
    certificationexpirationdate: Mapped[str] = mapped_column(DateTime, nullable=True)
    idelevatedpoint: Mapped[int] = mapped_column(Identity(start=1, cycle=True))
    idsignificantpoint: Mapped[int] = mapped_column(Identity(start=1, cycle=True))

    AirportHeliport: Mapped["AirportHeliport"] = relationship(back_populates="AirportHeliportsTimeSlices")
    timeslice: Mapped["Timeslice"] = relationship(back_populates="AirportHeliportsTimeSlices")
