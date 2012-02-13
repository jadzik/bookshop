require 'spec_helper'

describe Picture do
  it {should belong_to :product}
  it {should have_attached_file(:photo)}
end
