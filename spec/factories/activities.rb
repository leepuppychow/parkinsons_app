FactoryBot.define do
  factory :activity do
    description "Swimming"
    duration 30
    date_performed Date.today
  end
end
