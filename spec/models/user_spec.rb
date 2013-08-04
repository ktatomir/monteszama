require 'spec_helper'

describe User do
  it { should have_many(:orders) }
  it { should have_many(:items) }
  it { should have_many(:payments) }
  it { should validate_presence_of(:login) }
  it { should validate_presence_of(:email) }
  
  before(:each) do
    @user = create :user
  end
end
