class Contact < ActiveRecord::Base
  validates_presence_of :email, :sender_name, :contact_type, :content
  attr_accessor :id, :email, :sender_name, :contact_type, :content
 
  def initialize(attributes = {})
    attributes.each do |key, value|
      self.send("#{key}=", value)
    end
    @attributes = attributes
  end
 
  def read_attribute_for_validation(key)
    @attributes[key]
  end
 
  def to_key
  end
 
  def save
    if self.valid?
      Notifier.contact_notification(self).deliver!
      return true
    end
    return false
  end
end
