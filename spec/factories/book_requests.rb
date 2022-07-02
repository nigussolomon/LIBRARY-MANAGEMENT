FactoryBot.define do
  factory :book_request do
    user { nil }
    author { "MyString" }
    publisher { "MyString" }
    published_date { "2022-06-30" }
    category { "MyString" }
    isbn { "MyString" }
    status { "MyString" }
  end
end
