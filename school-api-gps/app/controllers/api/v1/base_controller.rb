class Api::V1::BaseController < ApplicationController
  before_action :authenticate_bearer!

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def authenticate_bearer!
    # Grab the Authorization header, expecting "Bearer <token>"
    auth_header = request.headers["Authorization"]

    if auth_header.present? && auth_header.start_with?("Bearer ")
      token = auth_header.split(" ").last
      # Split the comma-separated tokens from your ENV variable into an array
      valid_tokens = ENV.fetch("VALID_TOKENS", "").split(",").map(&:strip)
      unless valid_tokens.include?(token)
        render json: { error: "Unauthorized" }, status: :unauthorized and return
      end
    else
      render json: { error: "Unauthorized" }, status: :unauthorized and return
    end
  end

  def record_not_found(exception)
    Rails.logger.error("Record Not Found: #{exception.message}")
    render json: { error: "Record not found" }, status: :not_found
  end
end
