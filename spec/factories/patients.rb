FactoryBot.define do
  factory :patient do
    first_name "Lee"
    last_name "Chow"
    sequence(:username) {|n| "funbucket#{n}"}
    sequence(:password) {|n| "oohsecret#{n}"}
    age 32
    doctor

  end
end
