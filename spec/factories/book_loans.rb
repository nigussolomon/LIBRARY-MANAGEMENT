FactoryBot.define do
  factory :book_loan do
    user { nil }
    book { nil }
    due_date { "2022-06-30" }
    loan_date { "2022-06-30" }
  end
end
