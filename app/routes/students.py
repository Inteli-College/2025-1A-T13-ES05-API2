from fastapi import APIRouter, Depends, HTTPException
from supabase import Client
from typing import List
from models.schemas import Student, StudentCreate
from dependencies.supabase_client import get_supabase_client

router = APIRouter()

@router.get("/students", response_model=List[Student])
def get_students(skip: int = 0, limit: int = 100, supabase: Client = Depends(get_supabase_client)):
    response = supabase.table("students").select("*").execute()
    return response.data

@router.get("/students/{student_id}", response_model=Student)
def get_student(student_id: int, supabase: Client = Depends(get_supabase_client)):
    response = supabase.table("students").select("*").eq("id", student_id).execute()
    if not response.data:
        raise HTTPException(status_code=404, detail="Student not found")
    return response.data[0]

@router.post("/students", response_model=Student)
def create_student(student: StudentCreate, supabase: Client = Depends(get_supabase_client)):
    response = supabase.table("students").insert(student.dict()).execute()
    return response.data[0]

@router.put("/students/{student_id}", response_model=Student)
def update_student(student_id: int, student: StudentCreate, supabase: Client = Depends(get_supabase_client)):
    response = supabase.table("students").update(student.dict()).eq("id", student_id).execute()
    if not response.data:
        raise HTTPException(status_code=404, detail="Student not found")
    return response.data[0]

@router.delete("/students/{student_id}")
def delete_student(student_id: int, supabase: Client = Depends(get_supabase_client)):
    response = supabase.table("students").delete().eq("id", student_id).execute()
    if not response.data:
        raise HTTPException(status_code=404, detail="Student not found")
    return {"message": "Student deleted successfully"}