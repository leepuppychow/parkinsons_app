class Patient < ApplicationRecord
  validates :first_name, :last_name, presence: true
  has_many :patient_doctors
  has_many :doctors, through: :patient_doctors
  has_many :patient_medications
  has_many :medications, through: :patient_medications
  has_many :activities
  has_many :appointments
  belongs_to :user, optional: true

  scope :sorted_by_last_name, -> {order(:last_name)}
  
  def activities_with_duration_summed_per_day
    activities.group(:date_performed)
    .order("date_performed DESC")
    .limit(7)
    .sum(:duration)
  end

  def full_name
    "#{first_name} #{last_name}"
  end


  def self.from_omniauth(auth)
		where(uid: auth.uid).first_or_create do |patient|
      patient.uid = auth.uid
      patient.first_name = auth.info.first_name
      patient.last_name = auth.info.last_name
			patient.username = auth.info.name
      patient.token = auth.credentials.token

      patient.password = auth.info.password
		end
	end
end
