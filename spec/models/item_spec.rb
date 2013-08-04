require 'spec_helper'

describe Item do
  it { should validate_presence_of(:order_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:price) }
  it { should validate_uniqueness_of(:order_id).scoped_to(:user_id) }
  
  before(:each) do
    @item = create :item
  end
end
