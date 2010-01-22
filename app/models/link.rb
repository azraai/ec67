class Link < ActiveRecord::Base
  belongs_to :item
  validates_presence_of :url
end