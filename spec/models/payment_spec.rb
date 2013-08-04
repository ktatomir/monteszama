require 'spec_helper'

describe Payment do
  it { should validate_presence_of(:order_id) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:quant) }
  it { should validate_numericality_of(:quant) }
  
  
  
  before(:each) do 
    @payment = create :payment
  end
end
