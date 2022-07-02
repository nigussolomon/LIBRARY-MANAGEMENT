class BookHold < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :hold_date, :request_date, :status, presence: true
  validates :status, inclusion: { :in => ["Taken", "Canceled", "Due"] }
end
