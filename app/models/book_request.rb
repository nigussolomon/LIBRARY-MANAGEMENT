class BookRequest < ApplicationRecord
  belongs_to :user
  validates :user, :title, :author, :publisher, :status, presence: true
  validates :status, inclusion: { :in => ["Accepted", "Denied", "Pending"]}
end
