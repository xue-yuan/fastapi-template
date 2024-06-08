from fastapi import Depends
from sqlmodel import select, Session

from database import get_session
from scaffold.models.user import User


def get(session: Session = Depends(get_session)):
    try:
        with session.begin():
            User.create(session)
    except Exception as e:
        ...

    return {"foo": "bar"}
