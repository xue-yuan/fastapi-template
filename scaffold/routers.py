from handlers import heartbeat
from utils import APIRouter


from handlers.v1 import user


apiRouter = APIRouter(prefix="/api")
v1Router = APIRouter(prefix="/v1")
userRouter = APIRouter(prefix="/user", tags=["user"])

userRouter.add_get("/get", user.get)
userRouter.add_get("/get_with_auth", user.get, auth=True)

apiRouter.add_get("/heartbeat", heartbeat)

v1Router.include_router(userRouter)
apiRouter.include_router(v1Router)
