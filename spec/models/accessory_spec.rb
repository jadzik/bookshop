require 'spec_helper'

describe Accessory do
  it {should belong_to :category_accessory}
  it {should have_one :product}
  it {should validate_presence_of :category_accessory_id}
  it {should validate_presence_of :description}
  it {should validate_presence_of :price}
  it {should validate_presence_of :name}
end
