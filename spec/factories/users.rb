FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "funbucket#{n}"}
    sequence(:password) {|n| "oohsecret#{n}"}
    role 1
  end
end
