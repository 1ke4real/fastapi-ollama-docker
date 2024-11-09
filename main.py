from fastapi import FastAPI, Response
from pydantic import BaseModel
import requests

class PromptRequest(BaseModel):
    prompt: str
app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello this is autotrust-rcengine-ollama API"}

@app.post("/chat")
async def chat(request: PromptRequest):
    url = "http://autotrust-rcengine-ollama:11434/api/generate"
    req = requests.post(url, json={
        "model": "llama3.2",
        "prompt": request.prompt,
        "stream": False
    })
    res = req.json()

    return Response(content=res['response'], media_type="application/json")
