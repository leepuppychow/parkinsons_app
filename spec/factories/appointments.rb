FactoryBot.define do
  factory :appointment do
    date Date.today
    time DateTime.now
    status "Attended"
    patient
    doctor
  end
end
