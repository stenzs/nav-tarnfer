from uuid import UUID as _py_uuid
from sqlalchemy import Identity, ForeignKey, String
from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy_utils import CompositeType
from database.models.Base import Base
from database.models.CompositeTypes import (CodeYesNoType, ValFrequencyType, ValDistanceVerticalType,
                                            ValDistanceSignedType, ValDistanceType)


class RadioCommunicationChannelTimeSlice(Base):

    __tablename__ = "11radiocommunicationchanneltimeslice"

    idtimeslice: Mapped[int] = mapped_column(ForeignKey("11timeslice.idtimeslice"), primary_key=True, nullable=False)
    uuid: Mapped[_py_uuid] = mapped_column(UUID(as_uuid=True), ForeignKey("11radiocommunicationchannel.uuid"), nullable=False)
    mode: Mapped[str] = mapped_column(String, nullable=True)
    rank: Mapped[str] = mapped_column(String, nullable=True)
    frequencytransmission: Mapped[CompositeType] = mapped_column(ValFrequencyType, nullable=True)
    frequencyreception: Mapped[CompositeType] = mapped_column(ValFrequencyType, nullable=True)
    channel: Mapped[str] = mapped_column(String, nullable=True)
    logon: Mapped[str] = mapped_column(String, nullable=True)
    emissiontype: Mapped[str] = mapped_column(String, nullable=True)
    selectivecall: Mapped[CompositeType] = mapped_column(CodeYesNoType, nullable=True)
    flightchecked: Mapped[CompositeType] = mapped_column(CodeYesNoType, nullable=True)
    trafficdirection: Mapped[str] = mapped_column(String, nullable=True)
    idelevatedpoint: Mapped[int] = mapped_column(Identity(start=1, cycle=True))
    elevation: Mapped[CompositeType] = mapped_column(ValDistanceVerticalType, nullable=True)
    geoidundulation: Mapped[CompositeType] = mapped_column(ValDistanceSignedType, nullable=True)
    verticaldatum: Mapped[str] = mapped_column(String, nullable=True)
    verticalaccuracy: Mapped[str] = mapped_column(ValDistanceType, nullable=True)

    RadioCommunicationChannel: Mapped["RadioCommunicationChannel"] = relationship(back_populates="RadioCommunicationChannelTimeSlice")
    timeslice: Mapped["Timeslice"] = relationship(back_populates="RadioCommunicationChannelTimeSlice")
