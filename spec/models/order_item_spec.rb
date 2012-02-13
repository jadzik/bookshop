require 'spec_helper'

describe OrderItem do
  it {should belong_to :order}
  it {should validate_presence_of :product_id}
  it {should validate_presence_of :order_id}
  it {should validate_presence_of :name_of_product}
  it {should validate_presence_of :amount}
  it {should validate_presence_of :price_for_one}
end
