class ItemsController < InheritedResources::Base
  has_scope :type, :only => [:index, :new]
  
  def create
    create! { items_path }
  end
  
  def new
    @item = Item.new
    @item.build_note if params[:type] == 'note'
    @item.build_link unless params[:type] == 'note' 
    new!
  end
  
  def update
    update! { items_path }
  end
end