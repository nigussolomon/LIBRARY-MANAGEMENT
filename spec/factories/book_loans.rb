FactoryBot.define do
  factory :book_loan do
    association :user
    association :book
    due_date { Faker::Date.forward(days: 0) }
    loan_date { Faker::Date.forward(days: 15) }
  end
end
