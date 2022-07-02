FactoryBot.define do
  factory :book do
    book_code { "MyString" }
    title { "MyString" }
    author { "MyString" }
    publisher { "MyString" }
    published_date { "2022-06-30" }
    category { "MyString" }
    description { "MyText" }
    amount_copy { 1 }
    isbn { "MyString" }
    status { "MyString" }
  end
end
