class NewProduct < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  default_scope :order => "created_at DESC"
  validates_presence_of :resource_id, :resource_type
  validates_inclusion_of :resource_type, :in => %w(Game Book Accessory) 
  validates_numericality_of :resource_id
  validates_inclusion_of :resource_id, :in => Book.all.map(&:id), :if => Proc.new { |a| a.resource_type == "Book"}
  validates_inclusion_of :resource_id, :in => Game.all.map(&:id), :if => Proc.new { |a| a.resource_type == "Game"}
  validates_inclusion_of :resource_id, :in => Accessory.all.map(&:id), :if => Proc.new { |a| a.resource_type == "Accessory"}
end
