require 'rails_helper'

RSpec.describe BookHold, type: :model do
  subject { create(:book_hold) } 

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:book) }
  it { should validate_presence_of(:hold_date) }
  it { should validate_presence_of(:request_date) }
  it { should validate_presence_of(:status) }
  it { should validate_inclusion_of(:status).in_array(%w[Taken Canceled Due]) }
end
