FactoryBot.define do
  factory :book_hold do
    association :user
    association :book
    hold_date { Faker::Date.forward(days: 3) }
    request_date { Faker::Date.forward(days: 0) }
    status { "Taken" }
  end
end
