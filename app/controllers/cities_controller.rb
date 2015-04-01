class CitiesController < ApplicationController
  
  def show
    cities = City.where(state: params[:state].upcase)
      .page(params[:page]).per(50)
    render json: cities, status: 200
  end
  
  def index
    if(params[:radius].to_i == params[:radius])
      nearby_cities = City.radius_search(params)
      render json: nearby_cities, status: 200
    end
  end
  
  private
  def state_params
    params.require(:state).permit(:city, :radius)
  end
end
