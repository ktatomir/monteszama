require 'spec_helper'

describe Order do
  it { should have_many(:items).dependent(:destroy) }
  it { should have_many(:payments).dependent(:destroy) }
  it { should validate_presence_of(:owner_id) }
  it { should validate_presence_of(:desc) }
  
  before(:each) do
    @order = create :order
  end
  
  it "should choose random user to call" do
    user1 = create :user
    user2 = create :user
    @order.choose_caller
    @order.caller_id.should_not be_nil
  end
end
