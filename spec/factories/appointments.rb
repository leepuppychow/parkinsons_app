FactoryBot.define do
  factory :appointment do
    date_time DateTime.now
    status "Attended"
    patient
    doctor 
  end
end
