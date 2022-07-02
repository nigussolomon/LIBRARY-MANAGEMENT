require 'rails_helper'

RSpec.describe Instructor, type: :model do
  subject { create(:instructor) } 

  it {should validate_presence_of(:user)}
  it {should validate_presence_of(:course)}
end
