class Api::V1::InstitutionsController < Api::V1::BaseController
  # GET /api/v1/institutions
  def index
    institutions = Institution.all
    render json: institutions, each_serializer: InstitutionSerializer
  end

  # GET /api/v1/institutions/:id
  def show
    institution = Institution.find(params[:id])
    render json: institution, serializer: InstitutionSerializer
  end

  # GET /api/v1/institutions/:id/students
  def students
    institution = Institution.find(params[:id])
    # Eager load students with their enrollments, institutions and courses as needed.
    students = institution.students.includes(enrollments: [:institution, :course])
    render json: students, each_serializer: StudentSerializer
  end
end
