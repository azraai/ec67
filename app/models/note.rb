class Note < ActiveRecord::Base
  belongs_to :item  
  validates_presence_of :text
  validate :valid_value
  
  def valid_value
    errors.add(:text, "not a valid note") unless text.blank? or text != 'Enter note text'
  end
end