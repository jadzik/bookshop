require 'spec_helper'

describe Address do
  it {should belong_to :client}
  it {should validate_presence_of :house_number}
  it {should validate_presence_of :zip_code}
  it {should validate_presence_of :city}
  it {should validate_presence_of :client_id}
  it {should validate_presence_of :street} 
end
