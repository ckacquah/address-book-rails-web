class Region < ApplicationRecord
  include HandleSafely
  include HasSummary

  has_many :city_towns, -> { active_and_not_deleted }, class_name: 'CityTown', foreign_key: 'region_code'

  validates :name, presence: true
  validates :description, presence: true
end
