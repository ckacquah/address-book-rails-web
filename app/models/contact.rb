class Contact < ApplicationRecord
  include HandleSafely

  belongs_to :locality,  -> { active }, class_name: "Locality", foreign_key: "locality_code"
  validates_associated :locality

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, :numericality => true, :length => { :is => 10 }
  validates :description, presence: true
  validates :locality_code, presence: true
end
