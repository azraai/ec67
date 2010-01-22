class Note < ActiveRecord::Base
  belongs_to :item  
  validates_presence_of :text
end