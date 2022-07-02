require 'rails_helper'

RSpec.describe Category, type: :model do
  subject { create(:category) } 

  it { should validate_presence_of(:name) }
end
