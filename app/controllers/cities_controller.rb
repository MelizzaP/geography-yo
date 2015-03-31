class CitiesController < ApplicationController
  
  def show
    cities = City.where(state: params[:state].upcase)
    render json: cities, status: 200
  end
  
  def index
    nearby_cities = City.radius_search(params)
    render json: nearby_cities, status: 200
  end
  
  private
  def state_params
    params.require(:state).permit(:city, :radius)
  end
end
