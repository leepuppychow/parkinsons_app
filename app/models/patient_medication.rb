class PatientMedication < ApplicationRecord
  validates :dosage, :freq_per_day, presence: true
  belongs_to :patient
  belongs_to :medication 

end
