class PatientMedication < ApplicationRecord
  validates :dosage, :freq_per_day, presence: true
  belongs_to :patient
  belongs_to :medication
  accepts_nested_attributes_for :medication
  has_one :note, as: :noteable, dependent: :destroy
end
