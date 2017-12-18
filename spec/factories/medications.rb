FactoryBot.define do
  factory :medication do
    sequence(:name) {|n| "Sinemet#{n}"}
  end
end
