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
    users = []
    3.times do
      item = FactoryGirl.create(:item, :order_id => @order.id)
      users << item.user_id
    end
    @order.choose_caller
    @order.caller_id.should_not be_nil
    users.include?(@order.caller_id).should be_true
  end
  
  it "should choose owner to call id order users list is empty" do
    @order.users = []
    @order.choose_caller
    @order.caller_id.should eq(@order.owner_id)
  end
  
  it 'should generate slug' do
    @order.generate_slug
    @order.slug.should eq("#{Date.today}-#{@order.desc}".parameterize)
  end
end
