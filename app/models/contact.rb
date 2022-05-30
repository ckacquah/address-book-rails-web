class Contact < ApplicationRecord
  include HandleSafely
  belongs_to :locality,  -> { active }, class_name: "Locality", foreign_key: "locality_code"
end
