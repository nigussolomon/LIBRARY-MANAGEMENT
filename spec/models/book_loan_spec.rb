require 'rails_helper'

RSpec.describe BookLoan, type: :model do
  subject { create(:book_loan) } 

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:book) }
  it { should validate_presence_of(:due_date) }
  it { should validate_presence_of(:loan_date) }
  it { should validate_presence_of(:status) }
  it { should validate_inclusion_of(:status).in_array(%w[Return Due Overdue]) }
end
