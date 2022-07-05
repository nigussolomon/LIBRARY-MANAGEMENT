FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password_digest { Faker::Lorem.word }
    first_name { Faker::Name.name }
    last_name { Faker::Name.name }
    user_id { Faker::Code.npi }
  end
end
