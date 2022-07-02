require 'rails_helper'

RSpec.describe Student, type: :model do
  subject { create(:student) } 

  it { should validate_presence_of(:user) }
  it { should validate_presence_of(:year) }
  it { should validate_presence_of(:semester) }
end
