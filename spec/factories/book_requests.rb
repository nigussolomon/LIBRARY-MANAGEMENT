FactoryBot.define do
  factory :book_request do
    association :user
    author { Faker::Name.name }
    publisher { Faker::Name.name }
    published_date { Faker::Date.backward(days: 80) }
    category { Faker::Lorem.word }
    isbn { Faker::Code.isbn }
    status { "Pending" }
  end
end
