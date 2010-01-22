require File.join(File.dirname(__FILE__), "../test_helper")

class ItemsControllerTest < ActionController::TestCase
  fast_context "routing" do
    should_route :get,    '/items',         :controller => :items,  :action => :index
    should_route :get,    '/items/new',     :controller => :items,  :action => :new
    should_route :post,   '/items',         :controller => :items,  :action => :create
    should_route :get,    '/items/1',       :controller => :items,  :action => :show,     :id => 1
    should_route :put,    '/items/1',       :controller => :items,  :action => :update,   :id => 1
    should_route :get,    '/items/1/edit',  :controller => :items,  :action => :edit,     :id => 1
    should_route :delete, '/items/1',       :controller => :items,  :action => :destroy,  :id => 1  
  end
  
  fast_context "GET to index" do
    setup do
      @items = []
      @note_items = []
      @link_items = []
      
      2.times do
        link = Factory(:link_item_wa)
        @items << link
        @link_items << link
        
        note = Factory(:note_item_wa)
        @items << note
        @note_items << note
      end
    end
    
    fast_context "with no scope" do
      setup do
        get :index
      end
      
      should_assign_to(:items) { @items }
      should_render_with_layout
      should_render_template :index
      should_respond_with :success
      should_respond_with_content_type :html
      should_not_set_the_flash
    end
    
    fast_context "with type is link" do
      setup do
        get :index, :type => 'link'
      end
      
      should_assign_to(:items) { @link_items }
      should_render_with_layout
      should_render_template :index
      should_respond_with :success
      should_respond_with_content_type :html
      should_not_set_the_flash
    end
    
    fast_context "with type is note" do
      setup do
        get :index, :type => 'note'
      end
      
      should_assign_to(:items) { @note_items }
      should_render_with_layout
      should_render_template :index
      should_respond_with :success
      should_not_set_the_flash
    end
  end
  
  fast_context "GET to new" do
    fast_context "with no scope" do
      setup do
        get :new
      end
      
      should_assign_to(:item)
      should_render_with_layout
      should_render_template :new
      should_respond_with :success
      should_not_set_the_flash
    end
    
    fast_context "with type is link" do
      setup do
        get :new, :type => 'link'
      end
      
      should_assign_to(:item)
      should_render_with_layout
      should_render_template :new
      should_respond_with :success
      should_not_set_the_flash
    end
    
    fast_context "with type is note" do
      setup do
        get :new, :type => 'note'
      end
      
      should_assign_to(:item)
      should_render_with_layout
      should_render_template :new
      should_respond_with :success
      should_not_set_the_flash
    end
  end
  
  fast_context "POST to create" do
    setup do
        attributes = Factory.attributes_for(:link_item_wa)
        post :create, :item => attributes
      end
    
    should_set_the_flash_to /created/i
    should_redirect_to("items index") { items_path }
  end
    
  fast_context "GET to edit" do
    setup do
      @item = Factory(:link_item_wa)
      get :edit, :id => @item.id
    end
    
    should_assign_to(:item) { @item }
    should_render_with_layout
    should_render_template :edit
    should_respond_with :success
    should_not_set_the_flash
  end
  
  fast_context "PUT to update" do
    fast_context "link" do
      setup do
        @link = Factory(:link_item_wa)
        attributes = Factory.attributes_for(:link_item_wa)
        put :update, :id => @link.id, :item => attributes
      end
      
      should_set_the_flash_to /updated/i
      should_redirect_to("items index") { items_path }
    end
    
    fast_context "note" do
      setup do
        @note = Factory(:note_item_wa)
        attributes = Factory.attributes_for(:note_item_wa)
        put :update, :id => @note.id, :item => attributes
      end
      
      should_set_the_flash_to /updated/i
      should_redirect_to("items index") { items_path }
    end
  end
  
  fast_context "DELETE to destroy" do
    setup do
      @item = Factory(:item)
      delete :destroy, :id => @item.id
    end
    
    should_set_the_flash_to /destroyed/i
    should_redirect_to("items index") { items_path }
  end
end
