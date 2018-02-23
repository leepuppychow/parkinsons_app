FactoryBot.define do
  factory :user do
    sequence(:username) {|n| "lee#{n}"}
    sequence(:password) {|n| "oohsecret#{n}"}
  end
end
