class User < ActiveRecord::Base
  attr_accessible :login, :email, :id
  
  has_many :orders
  has_many :items
  has_many :payments
  
  validates :login, :email, presence: true
  
  def self.find_or_create(attrs)
    User.where(attrs).first || User.create(attrs)
  end
end
