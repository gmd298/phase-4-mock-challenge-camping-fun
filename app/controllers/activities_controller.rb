class ActivitiesController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :does_not_exist


  def index
    render json: Activity.all
  end

  def destroy
    activity = Activity.find(params[:id])
    activity.destroy
    head :no_content
  end



  private

  def does_not_exist
    render json: {error: "Activity does not exist"}, status: :not_found
  end


end
