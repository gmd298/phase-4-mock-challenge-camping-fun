class SignupsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_entity

  def create
    signup = Signup.create!(params_signup)
    render json: signup.activity, status: :created
  end


  private

  def params_signup
    params.permit( :time, :camper_id, :activity_id )
  end

  def unprocessable_entity(exception)
    render json: { errors: exception.record.errors.full_messages }, status: :unprocessable_entity
  end

end
