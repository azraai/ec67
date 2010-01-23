class CommentsController < InheritedResources::Base
  actions :index, :create
  belongs_to :item
  respond_to :json
  
  def create
    create! do
      cookies[:sc] = @comment.item.id
      root_path
    end
  end
end