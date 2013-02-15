#encoding: utf-8
class Product < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  has_many :pictures
  has_many :order_items
  has_many :orders, through: :order_items

  before_destroy :ensure_not_referenced_by_any_order_item

  validates_presence_of :resource_id, :resource_type
  validates_inclusion_of :resource_type, :in => %w(book Book accessory Accessory game Game) 
  validates_numericality_of :resource_id
  private
    def ensure_not_referenced_by_any_order_item
      if order_items.empty?
        return true
      else 
        errors.add(:base, 'Powiązany z jakimś zamówieniem!')
        return false
      end
    end
end
