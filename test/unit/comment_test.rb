require File.join(File.dirname(__FILE__), "../test_helper")

class CommentTest < ActiveSupport::TestCase
  
  should_belong_to :item
  should_validate_presence_of :name, :text
  
  should "valid with factory" do
    assert_valid Factory.build(:comment)
  end
end