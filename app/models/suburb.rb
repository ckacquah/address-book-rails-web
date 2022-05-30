class Suburb < ApplicationRecord
  include HandleSafely
  belongs_to :city_town,  -> { active }, class_name: 'CityTown', foreign_key: 'city_town_code'
  validates_associated :city_town

  validates :name, presence: true
  validates :description, presence: true
end
