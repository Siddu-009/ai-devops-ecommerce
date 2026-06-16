from fastapi import FastAPI
from pydantic import BaseModel
from openai import OpenAI
import os

app = FastAPI()

client = OpenAI(
api_key=os.getenv("OPENAI_API_KEY")
)

class ProductRequest(BaseModel):
prompt: str

@app.get("/health")
def health():
return {"status": "healthy"}

@app.post("/recommend")
def recommend(data: ProductRequest):
response = client.chat.completions.create(
model="gpt-4o-mini",
messages=[
{"role":"user","content":data.prompt}
]
)

```
return {
    "response": response.choices[0].message.content
}
```

}

