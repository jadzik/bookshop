#encoding: utf-8
class CategoryBooksController < ApplicationController
  def index
    @category_books = CategoryBook.all 
  end

  def show
    @category_book = CategoryBook.find(params[:id])
    @books = @category_book.books.page(params[:page]).per(10) 
  end
end
