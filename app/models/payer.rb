#encoding: utf-8
class Payer < ActiveRecord::Base
  belongs_to :client
  has_one :addresses, :as => :resource

  private
    def library_or_school_validation
      unless  client.type(@client_id) == "Biblioteka" || client.type(@client_id) == "szkoła"
        errors.add( "Twoja firma nie jest szkołą ani biblioteką, więc nie możesz dodać płatników.")
      end
    end

  validates_presence_of :name, :phone, :client_id, :nip
  validate :library_or_school_validation
  validates :nip, :format => { :with =>  /^[0-9]{10}$/, :message => "NIP jest złożony z 10 cyfr"}
  validates_numericality_of :client_id
  validates :phone, :format => { :with =>  /^([0-9]{9}$)|^(\([0-9]{2}\)[0-9]{7})$/, 
            :message => "numer telefony komórkowego jest złożony z 9 cyfr, a stacjonarny składa się z nr kierunkowego w nawiasach i numeru właściwego"}
end
