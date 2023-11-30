from fastapi import FastAPI
import os

app = FastAPI()


@app.get("/tell-me-the-secret")
def read_secret():
    secret = os.getenv("SECRET", "No secret found")
    return {"SECRET": secret}
