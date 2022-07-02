require 'rails_helper'

RSpec.describe User, type: :model do
  subject { create(:user) } 

  it { should validate_presence_of(:email) }
  it { should validate_uniqueness_of(:email) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:first_name) }
  it { should validate_presence_of(:last_name) }
  it { should validate_presence_of(:user_id) }
  it { should validate_uniqueness_of(:user_id) }
end
