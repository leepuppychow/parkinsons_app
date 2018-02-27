class Message < ApplicationRecord
  belongs_to :doctor
  belongs_to :patient

  enum status: ["unread", "read"]

  def self.conversation(patient, doctor)
    Message.where(patient_id: patient.id, doctor_id: doctor.id).order(:created_at).limit(10)
  end

  def new_message?
    return true if self.status == "unread"
  end

end
