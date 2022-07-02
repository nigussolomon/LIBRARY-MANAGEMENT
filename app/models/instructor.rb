class Instructor < ApplicationRecord
  belongs_to :user
  validates :user, :course, presence: true
end
