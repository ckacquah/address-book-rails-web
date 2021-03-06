class Contact < ApplicationRecord
  include HandleSafely

  include HasSummary

  VALID_PHONE_REGEX = /\+?\(?((233)|0)?\)?[-.\s]?\d{2}[-.\s]?\d{3}[-.\s]?\d{4}?\z/

  attr_accessor :region, :cities, :suburbs, :localities

  belongs_to :locality,  -> { active }, class_name: 'Locality', foreign_key: 'locality_code'
  
  has_one :suburb, through: :locality
  
  has_one :city_town, through: :suburb

  has_one :region, through: :city_town

  validates_associated :locality
  
  validates :first_name, presence: true

  validates :last_name, presence: true
  
  validates :locality_code, presence: true
  
  validates :phone, presence: true,
  
  format: { with: VALID_PHONE_REGEX, message: 'must be valid. Kindly use the following formats (233xxxxxxxx or 0xxxxxxxxx)' }
  
  scope :has_name_like, ->(name) { where('first_name like :name OR last_name like :name', {:name =>  "%#{name}%"}).all }
  
end
