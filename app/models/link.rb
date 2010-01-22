class Link < ActiveRecord::Base
  belongs_to :item
  validates_presence_of :url
  validate :valid_value
  
  def valid_value
    errors.add(:url, "not a valid url") unless url.blank? or desc != 'Enter link URL'
  end
end