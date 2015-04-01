class City < ActiveRecord::Base
  has_many :city_users
  has_many :users, through: :city_users
  
  def self.radius_search(params)
    city = City.where(
      'name = ? AND state = ?',
      params[:city].capitalize,
      params[:state].upcase
    )
      
    lat = city.first.latitude * Math::PI / 180
    lon = city.first.longitude * Math::PI / 180
    
    sql = %{
      SELECT * 
      FROM cities 
      WHERE acos(
        sin(#{lat}) * 
        sin(radians(latitude)) + 
        cos(#{lat}) * 
        cos(radians(latitude)) * 
        cos(radians(longitude) - (#{lon}))
      ) * 4000 <= #{params[:radius]}; 
     }
     radius = City.find_by_sql(sql)
     return Kaminari.paginate_array(radius).page(params[:page])
  end
end
