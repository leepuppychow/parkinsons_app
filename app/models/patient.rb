class Patient < ApplicationRecord
  has_secure_password
  validates :first_name, :last_name, :age, :password, presence: true
  validates :username, presence: true, uniqueness: true
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors
  has_many :patient_medications
  has_many :medications, through: :patient_medications
  has_many :therapist_patients
  has_many :therapists, through: :therapist_patients
  has_many :activities

  enum role: ["visitor", "admin", "patient"]

  def activities_with_duration_summed_per_day
    activities.group(:date_performed)
    .order("date_performed DESC")
    .limit(7)
    .sum(:duration)
  end

end
