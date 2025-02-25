# # from sqlalchemy import Column, String, Date, ForeignKey, ARRAY
# # from sqlalchemy.orm import relationship
# # from .base import Base

# # class EnrollmentDB(Base):
# #     __tablename__ = "enrollments"
    
# #     id = Column(String, primary_key=True)
# #     institution_name = Column(String)
# #     course = Column(String)
# #     course_type = Column(String)
# #     shift = Column(String)
# #     student_id = Column(String, ForeignKey('students.academic_id'))

# class StudentDB(Base):
#     __tablename__ = "students"
    
#     academic_id = Column(String, primary_key=True)
#     name = Column(String)
#     email = Column(String, unique=True)
#     date_of_birth = Column(Date)
#     contact_phone = Column(String)
#     enrollments = relationship("EnrollmentDB", back_populates="student")