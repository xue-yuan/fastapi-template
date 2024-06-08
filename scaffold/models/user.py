from sqlalchemy.orm import Session
from sqlmodel import Field, SQLModel


class User(SQLModel, table=True):

    __tablename__ = "users"

    id: int | None = Field(default=None, primary_key=True)
    name: str

    @classmethod
    def create(cls, s: Session, name="user"):
        user = cls(name=name)

        s.add(user)
        return user
