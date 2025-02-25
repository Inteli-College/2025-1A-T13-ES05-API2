class Api::V1::StudentsController < Api::V1::BaseController
  # GET /api/v1/students
  def index
    # Eager load associations to avoid N+1 query issues.
    students = Student.includes(enrollments: [ :institution, :course ]).all
    render json: students, each_serializer: StudentSerializer
  end

  # GET /api/v1/students/:id
  def show
    student = Student.includes(enrollments: [ :institution, :course ]).find(params[:id])
    render json: student, serializer: StudentSerializer
  end
end
