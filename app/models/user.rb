class User < ActiveRecord::Base
  attr_accessible :login, :email
  
  has_many :orders
  has_many :items
  has_many :payments
  
  validates :login, :email, presence: true
end
