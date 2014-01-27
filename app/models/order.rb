class Order < ActiveRecord::Base
  belongs_to :user

  has_many :order_items
  has_many :items, through: :order_items
  validates_inclusion_of :status, :in => ["submitted", "paid", "rejected", "complete"]

end
