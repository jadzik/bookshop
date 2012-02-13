require 'spec_helper'

describe Game do
  it {should belong_to :subcategory_game}
  it {should belong_to :category_game}
  it {should belong_to :publisher_game}
  it {should have_one :product}
  it {should validate_presence_of :name}
  it {should validate_presence_of :game_type}
  it {should validate_presence_of :publisher_game_id}
  it {should validate_presence_of :price}
  it {should validate_presence_of :description}
  it {should validate_presence_of :language}
  it {should validate_presence_of :instruction}
  it {should validate_presence_of :category_game_id}
  it {should validate_presence_of :age_of_players_from}
end
