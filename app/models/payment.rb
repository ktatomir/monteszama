class Payment < ActiveRecord::Base
  attr_accessible :order_id, :user_id
  
  belongs_to :user
  belongs_to :order
end
