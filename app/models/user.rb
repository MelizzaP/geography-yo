class User < ActiveRecord::Base
  has_many :city_users
  has_many :cities, through: :city_users
 
end
