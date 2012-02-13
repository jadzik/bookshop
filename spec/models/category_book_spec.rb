require 'spec_helper'

describe CategoryBook
  it {should have_many :subcategory_books }
  it {should have_many :books}
  it {should validate_uniqueness_of :name}
end
