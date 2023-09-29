from uuid import UUID as _py_uuid
from sqlalchemy import ForeignKey, String
from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy.dialects.postgresql import UUID
from sqlalchemy_utils import CompositeType
from database.models.Base import Base
from database.models.CompositeTypes import CodeYesNoType


class ProcedureTimeSlice(Base):

    __tablename__ = "11proceduretimeslice"

    idtimeslice: Mapped[int] = mapped_column(ForeignKey("11timeslice.idtimeslice"), primary_key=True, nullable=False)
    uuid: Mapped[_py_uuid] = mapped_column(UUID(as_uuid=True), ForeignKey("11procedure.uuid"), nullable=False)
    uuidarphlp: Mapped[_py_uuid] = mapped_column(UUID(as_uuid=True), ForeignKey("11airportheliport.uuid"), nullable=True)
    uuidsafealtitudearea: Mapped[_py_uuid] = mapped_column(UUID(as_uuid=True), ForeignKey("safealtitudearea.uuid"), nullable=True)
    communicationfailureinstruction: Mapped[str] = mapped_column(String, nullable=True)
    instruction: Mapped[str] = mapped_column(String, nullable=True)
    designcriteria: Mapped[str] = mapped_column(String, nullable=True)
    codingstandard: Mapped[str] = mapped_column(String, nullable=True)
    flightchecked: Mapped[CompositeType] = mapped_column(CodeYesNoType, nullable=True)
    flighttransition: Mapped[str] = mapped_column(String, nullable=True)
    name: Mapped[str] = mapped_column(String, nullable=True)
    rnav: Mapped[CompositeType] = mapped_column(CodeYesNoType, nullable=True)

    Procedure: Mapped["Procedure"] = relationship(back_populates="ProcedureTimeSlices")
    timeslice: Mapped["Timeslice"] = relationship(back_populates="ProcedureTimeSlices")
