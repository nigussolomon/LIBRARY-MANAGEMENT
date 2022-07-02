FactoryBot.define do
  factory :student do
    association :user
    year { Faker::Date.forwards(days: 0) }
    semester { 1 }
  end
end
