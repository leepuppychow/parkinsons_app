class Therapist < ApplicationRecord
  # validates :name, :specialty, :location, :phone, presence: true
  # has_many :therapist_patients
  # has_many :patients, through: :therapist_patients
  # has_one :note, as: :noteable, dependent: :destroy
  # has_many :appointments, as: :appointable

  def current_appointments(current_user)
    appointments.where(patient_id: current_user.id).future
  end

end
