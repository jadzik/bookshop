require 'spec_helper'

describe Payer do
  it {should belong_to :client}
  it {should validate_presence_of :name}
  it {should validate_presence_of :phone}
  it {should validate_presence_of :client_id}
  it {should validate_presence_of :nip}
  it {should validate_presence_of :street}
  it {should validate_presence_of :house_number}
  it {should validate_presence_of :zip_code}
  it {should validate_presence_of :city}
end
