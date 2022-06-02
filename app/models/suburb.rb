class Suburb < ApplicationRecord

  include HandleSafely

  belongs_to :city_town, -> { active }, class_name: 'CityTown', foreign_key: 'city_town_code'

  has_many :localities, -> { active_and_not_deleted }, class_name: 'Locality', foreign_key: 'suburb_code'

  validates_associated :city_town



  validates :name, presence: true

  validates :description, presence: true

end

