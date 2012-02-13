require 'spec_helper'

describe CategoryGame do
  it {should have_many :subcategory_games }
  it {should have_many :games}
end
