class CitiesController < ApplicationController
  
  def show
    cities = City.where(state: params[:state].upcase)
      .page(params[:page]).per(50)
    render json: cities, status: 200
  end
  
  def index
    if(params[:radius] && !params[:radius].match(/\D/))
      nearby_cities = City.radius_search(params)
      render json: nearby_cities, status: 200
    else
      render json: "Your request needs to have a numerical value for it's radius", status: 400
    end
  end
  
  private
  def state_params
    params.require(:state).permit(:city, :radius)
  end
end
