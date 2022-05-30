class Region < ApplicationRecord
  include HandleSafely
  has_many :city_towns,  -> { active }, class_name: 'CityTown', foreign_key: 'region_code'

  validates :name, presence: true
  validates :description, presence: true
end
