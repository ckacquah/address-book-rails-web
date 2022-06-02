class CityTown < ApplicationRecord
  include HandleSafely
  belongs_to :region, -> { active }, class_name: 'Region', foreign_key: 'region_code'
  has_many :suburbs, -> { active_and_not_deleted }, class_name: 'Suburb', foreign_key: 'city_town_code'

  validates_associated :region
  validates :name, presence: true
  validates :description, presence: true
end
