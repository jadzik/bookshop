class Product < ActiveRecord::Base
  belongs_to :resource, :polymorphic => true
  has_many :pictures
  validates_presence_of :resource_id, :resource_type
  validates_inclusion_of :resource_type, :in => %w(book Book accesory Accesory game Game) 
  validates_numericality_of :resource_id
end
