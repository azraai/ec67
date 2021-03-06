Factory.define :item do |i|
  i.name "Test Item"
  i.object "link"  
  i.desc "Example note for this link."
end

Factory.define :link_item, :parent => :item do |li|
  li.name "Bit.ly"
  li.desc "simple link shortening service"
end

Factory.define :note_item, :parent => :item do |ni|
  ni.name "How to use simpla?"
  ni.object "note"
  ni.desc "click start saving now"
end

Factory.define :link_item_wa, :parent => :link_item do |li|
  li.association :link, :factory => :link
end

Factory.define :note_item_wa, :parent => :note_item do |ni|
  ni.association :note, :factory => :note
end