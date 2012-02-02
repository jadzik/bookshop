#encoding: utf-8
class User < ActiveRecord::Base
  has_one :client, :as => :resource
  has_many :addresses
  after_create :make_client

  private
    def make_client
      self.create_client
    end

  validates_presence_of :name, :surname, :email, :phone
  validates_uniqueness_of :email
  validates :phone, :format => { :with =>  /^([0-9]{9}$)|^(\([0-9]{2}\)[0-9]{7})$/, 
            :message => "numer telefony komórkowego jest złożony z 9 cyfr, a stacjonarny składa się z nr kierunkowego w nawiasach i numeru właściwego"}
  validates :email, :format => {:with =>  /^\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z$/, 
            :message => "To nie jest e-mail"}
end
