class Doctor < ApplicationRecord
  validates :first_name,
            :last_name,
            :specialty,
            :location,
            :years_experience, presence: true, uniqueness: true
  has_many :patients
end
