require File.join(File.dirname(__FILE__), "../test_helper")

class NoteTest < ActiveSupport::TestCase
  
  should_belong_to :item
  should_validate_presence_of :text
  
  should "valid with Factory" do
    assert_valid Factory.build(:note)
  end
end