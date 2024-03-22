from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

import uvicorn
from analytics import a_router

app = FastAPI()

origins = [
    "http://localhost",
    "http://localhost:8080",
    "http://103.127.133.120:81",
    "http://localhost:8000",
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)


@app.get("/")
async def root():
    return {"message": "Hello World"}


app.include_router(a_router, prefix="/api")


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8082)
