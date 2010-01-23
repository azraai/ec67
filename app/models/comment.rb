class Comment < ActiveRecord::Base
  belongs_to :item
  
  default_scope :order => 'created_at DESC'
  named_scope :item, lambda { |item| { :conditions => { :item_id => item } } }
  
  validates_presence_of :name, :text
  validate :valid_value
  
  def valid_value
    errors.add(:name, "not a valid name") unless name.blank? or name != 'Your Name'
    errors.add(:text, "not a valid comment") unless text.blank? or text != 'Your Comment'
  end
end