class Student < ApplicationRecord
  belongs_to :user
  validates :user, :year, :semester, presence: true
end
