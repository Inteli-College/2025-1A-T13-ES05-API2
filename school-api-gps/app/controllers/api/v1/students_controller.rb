class Api::V1::StudentsController < Api::V1::BaseController
  # GET /api/v1/students/:id
  def show
    student = Student.includes(enrollments: [ :institution, :course ]).find(params[:id])
    render json: student, serializer: StudentSerializer
  end

  def enrollments
    student = Student.includes(enrollments: [ :institution, :course ]).find(params[:id])
    render json: student.enrollments, each_serializer: EnrollmentSerializer
  end
end
