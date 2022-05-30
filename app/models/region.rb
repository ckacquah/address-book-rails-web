class Region < ApplicationRecord
  include HandleSafely
  has_many :city_towns, class_name: 'CityTown', foreign_key: 'region_code'

end
