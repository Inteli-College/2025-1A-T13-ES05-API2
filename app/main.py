from fastapi import FastAPI
from routes import students_router
from dependencies.supabase_client import get_supabase_client
import uvicorn

app = FastAPI()

# Configurar CORS se necessário
from fastapi.middleware.cors import CORSMiddleware

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(students_router, prefix="/api")

@app.get("/")
def read_root():
    return {"message": "Welcome to Students API"}

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8000, log_level="info")
