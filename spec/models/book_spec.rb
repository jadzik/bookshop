require 'spec_helper'

describe Book do
  it {should belong_to :subcategory_book}
  it {should belong_to :publisher_book}
  it {should belong_to :category_book}
  it {should have_one :product}
  it {should validate_presence_of :title}
  it {should validate_presence_of :year_of_publishing}
  it {should validate_presence_of :number_of_pages}
  it {should validate_presence_of :price}
  it {should validate_presence_of :author}
  it {should validate_presence_of :description}
  it {should validate_presence_of :language}
  it {should validate_presence_of :publisher_book_id}
  it {should validate_presence_of :isbn}
  it {should validate_presence_of :category_book_id}
  it {should validate_presence_of :cover}
end
