class Medication < ApplicationRecord
  # validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :name, presence: true
  has_many :patient_medications
  has_many :patients, through: :patient_medications

#This allows you to edit patient_medications attributes along with medication attributes
  accepts_nested_attributes_for :patient_medications

end
