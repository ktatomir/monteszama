class Item < ActiveRecord::Base
  attr_accessible :name, :price, :order_id, :user_id
  
  belongs_to :user
  belongs_to :order
end
