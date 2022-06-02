class Locality < ApplicationRecord
  include HandleSafely
  include HasSummary

  belongs_to :suburb,  -> { active }, class_name: 'Suburb', foreign_key: 'suburb_code'
  
  validates :name, presence: true
  validates :description, presence: true
  validates_associated :suburb
end
