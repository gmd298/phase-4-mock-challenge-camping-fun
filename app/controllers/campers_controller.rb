class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :does_not_exist
  rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid

  def index
    render json: Camper.all
  end

  def show
    camper = find_camper
    render json: camper, serializer: CamperWithActivitiesSerializer
  end

  def create
    camper = Camper.create!(camper_params)
    render json: camper, status: :created
  end

  private

  def camper_params
    params.permit(:name, :age)
  end

  def find_camper
    camper = Camper.find(params[:id])
  end

  def does_not_exist
    render json: {error: "Camper not found"}, status: :not_found
  end

  def render_record_invalid(exception)
    render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
  end
end
