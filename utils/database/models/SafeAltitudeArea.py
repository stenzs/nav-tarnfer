from uuid import UUID as _py_uuid, uuid4
from sqlalchemy import String
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy.dialects.postgresql import UUID
from database.models.Base import Base


class SafeAltitudeArea(Base):

    __tablename__ = "safealtitudearea"

    uuid: Mapped[_py_uuid] = mapped_column(UUID(as_uuid=True), primary_key=True, nullable=False, default=uuid4)
    _transasid: Mapped[str] = mapped_column(String, nullable=False)
