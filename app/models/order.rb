class Order < ActiveRecord::Base
  attr_accessible :desc, :owner_id, :caller_id
  
  belongs_to :owner, class_name: "User"
  has_one :caller, class_name: "User"
  has_many :items, dependent: :destroy
  has_many :payments, dependent: :destroy
  has_many :users, through: :items
  
  validates :owner_id, :desc, presence: true
  validates :slug, uniqueness: true, presence: true
  
  before_validation :generate_slug
  
  delegate :login, to: :owner
  
  def choose_caller
    users = self.items.collect { |i| i.user_id }
    self.update_attributes(caller_id: users.any? ? users.sample : self.owner_id)
  end
  
  def to_param
    slug
  end
  
  def generate_slug
    self.slug ||= "#{Date.today}-#{desc}".parameterize
  end
  
end
