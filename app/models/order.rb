class Order < ActiveRecord::Base
  attr_accessible :desc, :owner_id, :caller_id
  
  belongs_to :owner, class_name: "User"
  has_one :caller, class_name: "User"
  has_many :items, dependent: :destroy
  has_many :payments, dependent: :destroy
end
