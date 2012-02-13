require 'spec_helper'

describe Product do
  it {should belong_to :resource}
  it {should have_many :pictures}
  it {should validate_presence_of :resource_id}
  it {should validate_presence_of :resource_type}
end
