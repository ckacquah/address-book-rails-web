class Suburb < ApplicationRecord
  include HandleSafely
  belongs_to :city_town,  -> { active }, class_name: 'CityTown', foreign_key: 'city_town_code'
end
