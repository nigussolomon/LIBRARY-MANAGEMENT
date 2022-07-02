class Book < ApplicationRecord
    validates :category, :book_code, :title, :author, :publisher, :published_date, :copy, :isbn, :status, presence: true
    validates :book_code, :isbn, uniqueness: {case_sensitive: false}
    validates :status, inclusion: { :in => ["Available", "Unavailable"]}
    validates :copy, numericality: { greater_than: 0}
end
