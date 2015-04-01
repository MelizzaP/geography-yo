class CityUsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  
  def new
    user = User.find(params[:user])
    city =  City.where(
      'name = ? AND state = ?',
      params[:city].capitalize,
      params[:state].upcase
    )
   
      visit = CityUser.new
      visit.city_id = city.first.id
      visit.user_id = user.id
      visit.save
      render json: visit, status: 201
  end

  def index
  end
end
