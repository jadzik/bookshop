#encoding: utf-8
class Payer < ActiveRecord::Base
  belongs_to :client

  private
    def library_or_school_validation
      unless  client.client_type(@client_id) == "szkoła lub biblioteka"
        errors.add( "Twoja firma nie jest szkołą ani biblioteką, więc nie możesz dodać płatników.")
      end
    end

  validates_presence_of :name, :phone, :client_id, :nip, :street, :house_number, :zip_code, :city
  validate :library_or_school_validation
  validates :nip, :format => { :with =>  /^[0-9]{10}$/, :message => "NIP jest złożony z 10 cyfr"}
  validates_numericality_of :client_id
  validates :phone, :format => { :with =>  /^([0-9]{9}$)|^(\([0-9]{2}\)[0-9]{7})$/, 
            :message => "numer telefony komórkowego jest złożony z 9 cyfr, a stacjonarny składa się z nr kierunkowego w nawiasach i numeru właściwego"}
  validates :house_number, :format => {:with =>  /^[1-9][0-9]{0,2}[a-z]{0,5}$/, 
            :message => "numer domu musi być liczbą większą od 1, może zawierać małe litery na końcu"}
  validates :apartment_number, :format => {:with =>  /^[1-9][0-9]{0,2}[a-z]{0,5}$/, 
            :message => "numer mieszkania musi być liczbą większą od 1, może zawierać małe litery na końcu"},
            :allow_blank => true
  validates :zip_code, :format =>{:with => /^[0-9]{2}\-[0-9]{3}$/}
end
