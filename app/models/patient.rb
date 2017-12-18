class Patient < ApplicationRecord
  validates :first_name, :last_name, :age, presence: true
  validates :email, :password, presence: true, uniqueness: true
  belongs_to :doctor, optional: true #in case patient doesn't have doctor
  has_many :patient_medications
  has_many :medications, through: :patient_medications
  has_many :therapist_patients
  has_many :therapists, through: :therapist_patients  

end
