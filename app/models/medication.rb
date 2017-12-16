class Medication < ApplicationRecord
  validates :name, presence: true
  has_many :patient_medications
  has_many :patients, through: :patient_medications 

end
