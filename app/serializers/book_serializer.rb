class BookSerializer < ActiveModel::Serializer
  attributes :id, :book_code, :title, :author, :publisher, :published_date, :category, :description, :copy, :isbn, :status
end
