class Therapist < ApplicationRecord
  validates :first_name, :last_name, :therapy_type, presence: true
  has_many :therapist_patients
  has_many :patients, through: :therapist_patients

end