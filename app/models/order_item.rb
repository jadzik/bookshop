#encoding: utf-8
class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :product

  attr_accessible :order_id, :product_id, :price_for_one, :name_of_product

  def total_price
    price_for_one * amount
  end

  validates_presence_of :product_id, :order_id, :amount,  :price_for_one, :name_of_product
  validates_numericality_of :product_id, :order_id
  validates :price_for_one, :numericality => { :precision => 2 }
  validates :amount, :numericality => { :greater_than => 0, :less_than => 999, :only_integer => true} 
end
