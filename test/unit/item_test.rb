require File.join(File.dirname(__FILE__), "../test_helper")

class ItemTest < ActiveSupport::TestCase
  
  should_have_one :link, :note
  should_have_many :comments
  should_validate_presence_of :name, :object
  
  should "valid with Factory" do
    assert_valid Factory.build(:item)
  end
  
  should "not save with invalid object" do
    item = Factory.build(:item, :object => 'binary')
    assert !item.save
  end
  
  fast_context"type named scope" do
    setup do
      @link_item = Factory(:link_item)
      @note_item = Factory(:note_item)
    end
    
    should "return link item when passed item" do
      assert_equal [@link_item], Item.type('link').all
    end
    
    should "return link item when passed note" do
      assert_equal [@note_item], Item.type('note').all
    end
  end
  
  #should test
  #named scope
  #association
end
