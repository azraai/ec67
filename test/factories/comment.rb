Factory.define :comment do |c|
  c.name "Ariff Azraai"
  c.text "This is my comment"
end

Factory.define :comment_item_link, :parent => :comment do |c|
  c.association :item, :factory => :link_item_wa
end