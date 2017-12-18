class Therapist < ApplicationRecord
  validates :first_name, :last_name, presence: true
  validates :therapy_type, presence: true, uniqueness: true
  has_many :therapist_patients
  has_many :patients, through: :therapist_patients

end
