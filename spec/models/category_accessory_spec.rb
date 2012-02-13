require 'spec_helper'

describe CategoryAccessory do
  it {should have_many :accessories}
  it {should validate_uniqueness_of :name}
end
