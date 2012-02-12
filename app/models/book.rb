#encoding: utf-8
class Book < ActiveRecord::Base
  belongs_to :subcategory_book
  belongs_to :publisher_book
  belongs_to :category_book
  has_one :product, :as => :resource
  after_create :make_product

  private
    def make_product
      self.create_product()
      #Rails.logger.info product.errors.inspect
    end

    def category_validation
      if !category_book.blank? and (category_book.subcategory_books(@category_book_id).any? and (subcategory_book(self.subcategory_book_id).category_book.id != category_book_id))
        errors.add(:title, "Musisz wybrać podgategorię wybranej kategorii !")
        elsif !category_book.blank? and !category_book.subcategory_books(@category_book_id).any? and !subcategory_book_id.blank?
          errors.add(:title, "Nie możesz wybrać podgategorii, ponieważ wybrana kategoria nie posiada podkategorii !")
      end
    end

  validates_presence_of :title, :year_of_publishing, :number_of_pages, :price, :author, :description, :language, 
                        :publisher_book_id, :isbn, :category_book_id, :cover
  validate :category_validation
  validates :isbn, :format => { :with => /[0-9]{10}| [0-9]{13}/, :message => "Isbn musi być ciągiem 10 lub 13 cyfr" }
  validates :price, :numericality => { :greater_than_or_equal_to => 0.0, :less_than_or_equal_to => 1000.0, :precision => 2 }
  validates :year_of_publishing, :numericality => { :greater_than => 1900, 
            :less_than_or_equal_to => Date.today.year, :only_integer => true }
  validates :number_of_pages, :numericality => { :greater_than => 0, :only_integer => true } 
  validates_inclusion_of :cover, :in => %w(miękka twarda), 
                         :message => "%{value} jest niedozwolona, może być miękka albo twarda" 
  validates :size, :format => {:with =>  /^[1-9][0-9]?(\,[1-9]{1})?\s[x]\s[1-9][0-9]?(\,[0-9]{1})?$/, 
            :message => "Podaj wymiary w cm 'wymiar x wymiar'"}, :allow_blank => true

end
