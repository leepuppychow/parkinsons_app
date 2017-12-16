class Doctor < ApplicationRecord
  validates :first_name,
            :last_name,
            :specialty,
            :location,
            :years_experience, uniqueness: true
  has_many :patients
end
