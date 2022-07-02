require 'rails_helper'

RSpec.describe Book, type: :model do
  subject { create(:book) } 

  it { should validate_presence_of(:category) }
  it { should validate_presence_of(:book_code) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:author) }
  it { should validate_presence_of(:publisher) }
  it { should validate_presence_of(:published_date) }
  it { should validate_presence_of(:copy) }
  it { should validate_presence_of(:isbn) }
  it { should validate_presence_of(:status) }

  it { should validate_uniqueness_of(:book_code).case_insensitive }
  it { should validate_uniqueness_of(:isbn).case_insensitive }

  it { should validate_inclusion_of(:status).in_array(%w[Available Unavailable]) }

  it { should validate_numericality_of(:copy).is_greater_than(0) }



end
