class Api::V1::CoursesController < Api::V1::BaseController
    # GET /api/v1/courses
    def index
      courses = Course.all
      render json: courses, each_serializer: CourseSerializer
    end

    # GET /api/v1/courses/:id
    def show
      course = Course.find(params[:id])
      render json: course, serializer: CourseSerializer
    end

    # GET /api/v1/courses/:id/students
    def students
      course = Course.find(params[:id])
      # Assuming each enrollment belongs to a course and a student.
      students = course.students.includes(:enrollments)
      render json: students, each_serializer: StudentSerializer
    end
end
