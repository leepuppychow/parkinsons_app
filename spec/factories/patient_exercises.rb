FactoryBot.define do
  factory :patient_exercise do
    sequence(:duration) {|n| "3#{n}"}
    sequence(:date_performed) {|n| "Today#{n}"}
  end
end
