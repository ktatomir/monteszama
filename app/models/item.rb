class Item < ActiveRecord::Base
  attr_accessible :name, :price, :order_id, :user_id
  
  belongs_to :user
  belongs_to :order
  
  delegate :login, to: :user
  delegate :desc, to: :order
  
  validates :name, :price, :order_id, :user_id, presence: true
  validates :user_id, uniqueness: { scope: :order_id }
  validates :price, numericality: true, allow_nil: true
end
