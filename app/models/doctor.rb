class Doctor < ApplicationRecord
  validates :first_name,
            :last_name,
            :specialty,
            :location,
            :years_experience, presence: true
  has_many :patients, dependent: :destroy



end
