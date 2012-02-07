#encoding: utf-8
class Client < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :resource
  :prerequisite_attributes
  belongs_to :resource, :polymorphic => true

  validates_presence_of :resource_id, :resource_type
  validates :email, :format => {:with =>  /^\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z$/, 
            :message => "To nie jest e-mail"}
  validates_inclusion_of :resource_type, :in => %w(user User company Company) 
  validates_numericality_of :resource_id
end
