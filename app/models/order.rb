class Order < ActiveRecord::Base
  attr_accessible :desc, :owner_id, :caller_id
  
  belongs_to :owner, class_name: "User"
  has_one :caller, class_name: "User"
  has_many :items, dependent: :destroy
  has_many :payments, dependent: :destroy
  
  validates :owner_id, :desc, presence: true
  
  def choose_caller
    users = self.items.collect { |i| i.user_id }
    self.update_attributes(caller_id: users.sample)
  end
  
end
