FactoryBot.define do
  factory :patient do
    first_name "Lee"
    last_name "Chow"
    sequence(:email) {|n| "lee#{n}@gmail.com"}
    sequence(:password) {|n| "oohsecret#{n}"}
    age 32
    doctor

  end
end
