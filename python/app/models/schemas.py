from pydantic import BaseModel, Field, EmailStr
from datetime import date
from typing import List, Optional


class EnrollmentBase(BaseModel):
    institution_name: str
    course: str
    course_type: str
    shift: str


class EnrollmentCreate(EnrollmentBase):
    student_id: str


class Enrollment(EnrollmentBase):
    id: str
    student_id: str

    class Config:
        arbitrary_types_allowed = True


class StudentBase(BaseModel):
    name: str
    email: EmailStr
    academic_id: str = Field(..., alias="academic_id")
    date_of_birth: date
    contact_phone: str


class StudentCreate(StudentBase):
    pass


class Student(StudentBase):
    enrollments: List[Enrollment] = []

    class Config:
        arbitrary_types_allowed = True