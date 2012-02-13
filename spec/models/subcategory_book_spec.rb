require 'spec_helper'

describe SubcategoryBook do
  it {should belong_to :category_book}
  it {should have_many :books}
  it {should validate_presence_of :category_book_id}
end
