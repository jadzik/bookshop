#encoding: utf-8
class SubcategoryBooksController < ApplicationController
 def index
    @subcategory_books = SubcategoryBook.all 
  end

  def show
    @subcategory_book = SubcategoryBook.find(params[:id])
    @books = @subcategory_book.books.page(params[:page]).per(10) 
  end

end
