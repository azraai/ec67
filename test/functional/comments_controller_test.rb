require File.join(File.dirname(__FILE__), "../test_helper")

class CommentsControllerTest < ActionController::TestCase
  fast_context "routing" do
    should_route :get,    '/items/1/comments',         :controller => :comments,  :action => :index,  :item_id => 1
    should_route :post,   '/items/1/comments',         :controller => :comments,  :action => :create, :item_id => 1
  end
  
  fast_context "GET to index" do
    setup do
      @comment = Factory(:comment_item_link)
      get :index, :format => "json", :item_id => @comment.item.id
    end
    
    should_assign_to(:comments) { [@comment] }
    should_respond_with :success
    should_respond_with_content_type :json
  end
  
  fast_context "POST to create" do
    setup do
      item  = Factory(:link_item_wa)
      attributes = Factory.attributes_for(:comment)
      post :create, :item_id => item.id, :comment => attributes
    end
    
    should_set_the_flash_to /created/i
    should_redirect_to("items index") { root_path }
  end
end