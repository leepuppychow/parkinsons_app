FactoryBot.define do
  factory :message do
    sequence(:title) {|n| "Title#{n}"}
    sequence(:content) {|n| "Message contents#{n}"}
    status "unread"
    patient
    doctor
  end
end
