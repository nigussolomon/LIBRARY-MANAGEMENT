FactoryBot.define do
  factory :book do
    book_code { Faker::Code.npi }
    title { Faker::Lorem.word }
    author { Faker::Name.name }
    publisher { Faker::Name.name }
    published_date { Faker::Date.backward(days: 80) }
    category { Faker::Lorem.word }
    description { Faker::Lorem.paragraph }
    copy { 1 }
    isbn { Faker::Code.isbn }
    status { "Available" }
  end
end
