class CampersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :does_not_exist

  def index
    render json: Camper.all
  end

  def show
    camper = camper.find(params[:id])
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

  def does_not_exist
    render json: {error: "Camper does not exist"}, status: :not_found
  end
end
