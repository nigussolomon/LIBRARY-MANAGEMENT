FactoryBot.define do
  factory :book_hold do
    association :user
    association :book
    hold_date { Faker::Date.forward(days: 3) }
  end
end
