FactoryBot.define do
  factory :patient_medication do
    dosage "250mg"
    freq_per_day 2
    patient
    medication 
  end
end
