class CityTown < ApplicationRecord
  include HandleSafely

  belongs_to :region, class_name: 'Region', foreign_key: 'region_code'

  # def region
  #   Region.find_safely(region_code)
  # end
end
