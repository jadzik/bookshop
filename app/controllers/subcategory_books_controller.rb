#encoding: utf-8
class SubcategoryBooksController < ApplicationController
 def index
   @cart = current_order

    @subcategory_books = SubcategoryBook.all 
  end

  def show
   @cart = current_order

    @subcategory_book = SubcategoryBook.find(params[:id])
    @books = @subcategory_book.books.page(params[:page]).per(10) 
  end

end
