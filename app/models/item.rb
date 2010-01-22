class Item < ActiveRecord::Base
  has_one :link
  has_one :note
  has_many :comments
  accepts_nested_attributes_for :note, :link
  
  default_scope :order => 'created_at DESC'
  named_scope :type, lambda { |type| { :conditions => { :object => type } } }
  
  validates_presence_of :name, :object
  validate :valid_object, :valid_value
  
  OBJECT_LIST = ['link', 'note', 'image']
  
  def valid_object
    errors.add(:object, "not a valid object") if !object.blank? and !OBJECT_LIST.include?(object)
  end
  
  def valid_value
    errors.add(:name, "not a valid name") unless name.blank? or name != 'Enter your name'
    errors.add(:desc, "not a valid note") unless desc.blank? or desc != 'Enter your note'
  end
  
  def valid_url
  end  
end
