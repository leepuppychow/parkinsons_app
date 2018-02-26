class Doctor < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :phone, :location, presence: true
  has_many :patient_doctors
  has_many :patients, through: :patient_doctors
  has_one :note, as: :noteable, dependent: :destroy
  has_many :appointments
  belongs_to :user, optional: true

  def current_appointments(current_user)
    appointments.where(patient_id: current_user.id).future
  end

  def registered_user?
    return true if self.user
  end

end
