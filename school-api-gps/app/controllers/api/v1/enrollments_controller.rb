class Api::V1::EnrollmentsController < Api::V1::BaseController
  def show
    enrollment = Enrollment.includes(:institution, :course, :student).find(params[:id])
    render json: enrollment, serializer: EnrollmentSerializer
  end
end
