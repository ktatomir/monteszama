class Item < ActiveRecord::Base
  attr_accessible :name, :price, :order_id, :user_id
  
  belongs_to :user
  belongs_to :order
  
  validates :name, :price, :order_id, :user_id, presence: true
  validates :order_id, uniqueness: { scope: :user_id }
end
