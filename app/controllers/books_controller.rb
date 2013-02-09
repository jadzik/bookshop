#encoding: utf-8
class BooksController < ApplicationController
  def index
   @cart = current_order

    @books = Book.order("title").page(params[:page]).per(10) 
  end

  def show
   @cart = current_order

    @book = Book.find(params[:id])
  end
end
