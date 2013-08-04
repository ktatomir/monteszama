require 'spec_helper'

describe Payment do
  it { should validate_presence_of(:order_id) }
  it { should validate_presence_of(:user_id) }
  
  before(:each) do 
    @payment = create :payment
  end
end
