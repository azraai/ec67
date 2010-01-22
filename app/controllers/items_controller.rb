class ItemsController < InheritedResources::Base
  has_scope :type, :only => [:index, :new]
  
  def create
    create! { root_path }
  end
  
  def destroy
    destroy! { root_path }
  end
  
  def new
    @item = Item.new
    @item.build_note if params[:type] == 'note'
    @item.build_link unless params[:type] == 'note' 
    new!
  end
  
  def update
    update! { root_path }
  end
end