require 'spec_helper'

describe SubcategoryGame do
  it {should belong_to :category_game}
  it {should have_many :games}
  it {should validate_presence_of :category_game_id}
end
