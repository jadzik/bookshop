require 'spec_helper'

describe CategoryBook do
  it {should have_many :subcategory_books }
  it {should have_many :books}
end
