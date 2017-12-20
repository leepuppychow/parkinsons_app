class Patient < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :age, :password, presence: true
  validates :username, presence: true, uniqueness: true
  #for some reason, when validating that :password was uniqu on line 5 caused problems??
  belongs_to :doctor, optional: true #in case patient doesn't have doctor
  has_many :patient_medications
  has_many :medications, through: :patient_medications
  has_many :therapist_patients
  has_many :therapists, through: :therapist_patients
  has_many :activities
  # has_many :patient_exercises
  # has_many :exercises, through: :patient_exercises

  enum role: ["visitor", "admin", "patient"]

end
