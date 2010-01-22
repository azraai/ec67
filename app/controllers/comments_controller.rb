class CommentsController < InheritedResources::Base
  actions :index, :create
  respond_to :json
  has_scope :item
  
  def create
    create! do
      cookies[:sc] = @comment.item_id
      root_path
    end
  end
end