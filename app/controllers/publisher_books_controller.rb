#encoding: utf-8
class PublisherBooksController < ApplicationController
  def index
   @cart = current_order

    @publisher_books = PublisherBook.all 
  end

  def show
   @cart = current_order

    @publisher_book = PublisherBook.find(params[:id])
    @books = @publisher_book.books.page(params[:page]).per(10)
  end

end
