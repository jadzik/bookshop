#encoding: utf-8
class PublisherBooksController < ApplicationController
  def index
    @publisher_books = PublisherBook.all 
  end

  def show
    @publisher_book = PublisherBook.find(params[:id])
    @books = @publisher_book.books.page(params[:page]).per(10)
  end

end
