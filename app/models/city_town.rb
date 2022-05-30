class CityTown < ApplicationRecord
  include HandleSafely
  belongs_to :region,  -> { active }, class_name: "Region", foreign_key: "region_code"
end
