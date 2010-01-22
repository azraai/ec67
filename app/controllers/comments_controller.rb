class CommentsController < InheritedResources::Base
  actions :index, :create
  respond_to :json
  has_scope :item
  
  def create
    create! do
      cookies[:sc] = @comment.item.id
      items_path
    end
  end
end