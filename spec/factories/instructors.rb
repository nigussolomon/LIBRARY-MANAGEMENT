FactoryBot.define do
  factory :instructor do
    association :user
    course { Faker::Lorem.word }
  end
end
