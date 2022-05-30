class Region < ApplicationRecord
  include HandleSafely
  has_many :city_towns,  -> { active }, class_name: 'CityTown', foreign_key: 'region_code'
end
