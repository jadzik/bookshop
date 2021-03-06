class Accessory < ActiveRecord::Base
  belongs_to :category_accessory
  has_one :product, :as => :resource
  after_create :make_product
  default_scope :order => "name"

  private
    def make_product
      self.create_product()
      Rails.logger.info product.errors.inspect
    end

  validates_presence_of :name, :price, :description, :category_accessory_id
  validates :price, :numericality => { :greater_than_or_equal_to => 0.0, :less_than_or_equal_to => 1000.0, :precision => 2}
end
