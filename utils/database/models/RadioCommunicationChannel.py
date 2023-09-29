from typing import List
from uuid import UUID as _py_uuid, uuid4
from sqlalchemy.orm import Mapped, mapped_column, relationship
from sqlalchemy.dialects.postgresql import UUID
from database.models.Base import Base


class RadioCommunicationChannel(Base):

    __tablename__ = "11radiocommunicationchannel"

    uuid: Mapped[_py_uuid] = mapped_column(UUID(as_uuid=True), primary_key=True, nullable=False, default=uuid4)

    RadioCommunicationChannelTimeSlice: Mapped[List["RadioCommunicationChannelTimeSlice"]] = relationship(back_populates="RadioCommunicationChannel", cascade="all, delete-orphan")
