#encoding: utf-8
class Order < ActiveRecord::Base
  has_many :order_items, dependent: :destroy


# validates_presence_of :status, :summary_price#, :client_id, :address_id, :payment_type, :delivery_type
#  validates_numericality_of :client_id, :address_id
#  validates :payer_id, :numericality => true, :allow_blank => true
#  validates :summary_price, :numericality => { :precision => 2 }
#  validates_inclusion_of :status, :in => %w(cart )
#  validates_inclusion_of :payment_type, :in => %w()
#  validates_inclusion_of :delivery_type, :in => %w()
end
