class Payment < ActiveRecord::Base
  attr_accessible :order_id, :user_id, :quant
  
  belongs_to :user
  belongs_to :order
  
  delegate :login, to: :user
  
  validates :order_id, :user_id, :quant, presence: true
  validates :quant, numericality: true, allow_nil: true
end
