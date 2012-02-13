require 'spec_helper'

describe Client do
  it {should have_many :addresses}
  it {should have_many :payers}
  it {should have_many :orders}
  it {should validate_presence_of :name}
  it {should validate_presence_of :email}
  it {should validate_presence_of :client_type}
end
