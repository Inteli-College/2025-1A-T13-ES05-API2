# app/controllers/api/v1/base_controller.rb
class Api::V1::BaseController < ApplicationController
  include ActionController::HttpAuthentication::Basic::ControllerMethods

  before_action :authenticate

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV["API_USERNAME"] && password == ENV["API_PASSWORD"]
    end
  end

  def record_not_found(exception)
    Rails.logger.error("Record Not Found: #{exception.message}")
    render json: { error: "Record not found" }, status: :not_found
  end
end
