class CityUsersController < ApplicationController
  skip_before_filter  :verify_authenticity_token
  
  def new
    if(params[:city] && params[:state])
      user = User.find_by(id: params[:user])
      city =  City.where(
        'name = ? AND state = ?',
        params[:city].capitalize,
        params[:state].upcase
      )
      if(user && city.length > 0)
        visit = CityUser.new
        visit.city_id = city.first.id
        visit.user_id = user.id
        visit.save
        render json: visit, status: 201
      else
        render json: 'User and/or city not in database :-(', status: 400
      end
    else
      render json: 'City or state missing from parameters', status: 400
    end
  end

  def index
    cities = City.includes(:users).where(users: { id: params[:user]})
    
    render json: cities, status: 200
  end
end
