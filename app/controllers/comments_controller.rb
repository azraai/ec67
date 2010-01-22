class CommentsController < InheritedResources::Base
  actions :index, :create
  respond_to :json
  has_scope :item
  
  def create
    create! { items_path }
  end
end