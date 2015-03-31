class CreateCityUsers < ActiveRecord::Migration
  def change
    create_table :city_users do |t|
      t.references :city, index: true
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :city_users, :cities
    add_foreign_key :city_users, :users
  end
end
