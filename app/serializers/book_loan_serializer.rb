class BookLoanSerializer < ActiveModel::Serializer
  attributes :id, :user, :book, :due_date, :loan_date, :status
end
