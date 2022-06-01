class CityTown < ApplicationRecord
  include HandleSafely
  belongs_to :region,  -> { active }, class_name: "Region", foreign_key: "region_code"
  has_many :suburbs, -> { active }, class_name: 'Suburb', foreign_key: 'suburb_code'

  validates_associated :region
  validates :name, presence: true
  validates :description, presence: true
end
