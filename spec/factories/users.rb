FactoryBot.define do
  factory :user do
    email { "MyString" }
    password_digest { "MyString" }
    first_name { "MyString" }
    last_name { "MyString" }
    user_type { "MyString" }
  end
end