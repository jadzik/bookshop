require 'spec_helper'

describe CategoryGame
  it {should have_many :subcategory_games }
  it {should have_many :games}
  it {should validate_uniqueness_of :name}
end
