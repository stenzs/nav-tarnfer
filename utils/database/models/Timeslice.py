from typing import List
from datetime import datetime
from sqlalchemy import ForeignKey, Identity, Column, Integer, String, Float, DateTime
from sqlalchemy.orm import Mapped, mapped_column, relationship
from database.models.Base import Base


class Timeslice(Base):

    __tablename__ = "11timeslice"

    idtimeslice: Mapped[int] = mapped_column(Integer, primary_key=True, nullable=False, autoincrement=True)
    validtimebegin: Mapped[datetime] = mapped_column(DateTime)
    validtimeend: Mapped[datetime] = mapped_column(DateTime, nullable=True)
    interpretation: Mapped[str] = mapped_column(String, nullable=True)
    sequencenumber: Mapped[int] = mapped_column(Integer)
    correctionnumber: Mapped[int] = mapped_column(Integer)

    AirportHeliportsTimeSlices: Mapped[List["AirportHeliportTimeSlice"]] = relationship(back_populates="timeslice", cascade="all, delete-orphan")
    ProcedureTimeSlices: Mapped[List["ProcedureTimeSlice"]] = relationship(back_populates="timeslice", cascade="all, delete-orphan")
    RadioCommunicationChannelTimeSlice: Mapped[List["RadioCommunicationChannelTimeSlice"]] = relationship(back_populates="timeslice", cascade="all, delete-orphan")
