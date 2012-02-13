class PublisherGame < ActiveRecord::Base
  has_many :games
  default_scope :order => "name"
end
