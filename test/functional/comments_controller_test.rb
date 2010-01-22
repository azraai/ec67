require File.join(File.dirname(__FILE__), "../test_helper")

class CommentsControllerTest < ActionController::TestCase
  fast_context "routing" do
    should_route :get,    '/comments',         :controller => :comments,  :action => :index
    should_route :post,   '/comments',         :controller => :comments,  :action => :create
  end
  
  fast_context "GET to index" do
    fast_context "with JSON format" do
      setup do
        @comment = Factory(:comment_item_link)
        get :index, :format => "json"
      end
      
      should_assign_to(:comments) { [@comment] }
      should_respond_with :success
      should_respond_with_content_type :json
    end
    
    fast_context "with JSON format and item scope" do
      setup do
        @comment = Factory(:comment_item_link)
        get :index, :format => "json", :item => @comment.item.id
      end
      
      should "has same item id" do
        response = JSON.parse(@controller.response.body)
        assert_equal @comment.item.id, response[0]["comment"]["item_id"]
      end
      should_assign_to(:comments) { [@comment] }
      should_respond_with :success
      should_respond_with_content_type :json
    end
  end
  
  fast_context "POST to create" do
    setup do
      attributes = Factory.attributes_for(:comment_item_link)
      post :create, :comment => attributes
    end
    
    should_set_the_flash_to /created/i
    should_redirect_to("items index") { items_path }
  end
end