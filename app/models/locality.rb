class Locality < ApplicationRecord
  include HandleSafely
  include HasSummary

  belongs_to :suburb,  -> { active }, class_name: 'Suburb', foreign_key: 'suburb_code'
  validates_associated :suburb

  validates :name, presence: true
  validates :description, presence: true
end
