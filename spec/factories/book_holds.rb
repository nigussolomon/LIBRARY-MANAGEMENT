FactoryBot.define do
  factory :book_hold do
    user { nil }
    book { nil }
    hold_date { "2022-06-30" }
  end
end
