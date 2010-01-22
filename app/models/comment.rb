class Comment < ActiveRecord::Base
  belongs_to :item
  
  default_scope :order => 'created_at DESC'
  named_scope :item, lambda { |item| { :conditions => { :item_id => item } } }
  
  validates_presence_of :name, :text
end