class Picture < ActiveRecord::Base
  belongs_to :product
  has_attached_file :photo, :styles => { :small  => "150x150>" , :large => "500x500>"},
                    :url  => "/assets/products/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/products/:id/:style/:basename.:extension"
validates_attachment_presence :photo
end
