class Doctor < ApplicationRecord
  validates :first_name,
            :last_name,
            :specialty,
            :location,
            :years_experience, presence: true
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors
end
