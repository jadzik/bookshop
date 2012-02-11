#encoding: utf-8
class Client < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :mobile_phone, :fax_phone, 
                  :stationary_phone, :nip, :client_type
  has_many :addresses
  has_many :payers
  has_many :orders


  private
   def phone_cannot_be_blank
      if mobile_phone.blank? and stationary_phone.blank?
        errors.add(:mobile_phone,"Musisz podać przynajmniej jeden numer telefonu!")
      end
    end
   def type_validation
     unless (client_type == "klient indywidualny" || client_type == "firma" || client_type == "szkoła lub biblioteka")
       errors.add(:client_type, "Typ konta źle wybrany")
    end
   end

  validates_presence_of :name, :email, :client_type
  validate :phone_cannot_be_blank
  with_options :if => lambda {self.client_type != "klient indywidualny"} do |company|
    company.validates :nip, :presence => true, :uniqueness =>true, 
                            :format => { :with =>  /^[0-9]{10}$/, :message => "NIP jest złożony z 10 cyfr bez myślników"}
  end
  validates :email, :format => {:with =>  /^\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z$/, 
            :message => "To nie jest e-mail"}, :uniqueness => true
  validates :mobile_phone, :format => { :with =>  /^[0-9]{9}$/, 
            :message => "numer telefony komórkowego jest złożony z 9 cyfr"}, :allow_blank => true
  validates :fax_phone, :format => {:with =>  /^\([0-9]{2}\)[0-9]{7}$/, 
            :message => "numer musi składać się z nr kierunkowego w nawiasach i numeru właściwego"},:allow_blank => true
  validates :stationary_phone, :format => {:with =>  /^\([0-9]{2}\)[0-9]{7}$/, 
            :message => "numer musi składać się z nr kierunkowego w nawiasach i numeru właściwego"},:allow_blank => true

end
