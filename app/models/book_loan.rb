class BookLoan < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user, :book, :due_date, :loan_date, :status, presence: true
  validates :status, inclusion: { :in => ["Return", "Due", "Overdue"] }
end
