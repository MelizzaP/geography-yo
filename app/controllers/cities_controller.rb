class CitiesController < ApplicationController
  
  def show
    cities = City.where(state: params[:state].upcase)
    render json: cities, status: 200
  end
  
  def index
    selected_city = City.where(
      'name = ? AND state = ?',
      params[:city].capitalize,
      params[:state].upcase
      )
    
    lat = selected_city.first.latitude * Math::PI / 180
    lon = selected_city.first.longitude * Math::PI / 180
    
    sql = %{
      SELECT * 
      FROM cities 
      WHERE acos(
        sin(#{lat}) * 
        sin(radians(latitude)) + 
        cos(#{lat}) * 
        cos(radians(latitude)) * 
        cos(radians(longitude) - (#{lon}))
      ) * 4000 <= 100; 
     } 
         
    nearby_cities = City.find_by_sql(sql)
    render json: nearby_cities, status: 200
  end
  
  private
  def state_params
    params.require(:state).permit(:city, :radius)
  end
end
