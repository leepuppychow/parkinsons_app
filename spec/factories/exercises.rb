FactoryBot.define do
  factory :exercise do
    sequence(:name) {|n| "Squats#{n}"}
    sequence(:description) {|n| "Do the squats#{n}"}
    sequence(:image) {|n| "Squat.jpg#{n}"}
  end
end
