require File.join(File.dirname(__FILE__), "../test_helper")

class LinkTest < ActiveSupport::TestCase

  should_belong_to :item  
  should_validate_presence_of :url
  
  should "valid with Factory" do
    assert_valid Factory.build(:link)
  end
end