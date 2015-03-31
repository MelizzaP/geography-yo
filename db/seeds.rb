require 'csv'

cities_csv_text = File.read('db/cities.csv')
cities_csv = CSV.parse(cities_csv_text, :headers => true)

cities_csv.each do |row|
  City.create!(row.to_hash)
end

users_csv_text = File.read('db/users.csv')
users_csv = CSV.parse(users_csv_text, :headers => true)

users_csv.each do |row|
  User.create!(row.to_hash)
end