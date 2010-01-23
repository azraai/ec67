class CommentsController < InheritedResources::Base
  actions :index, :create
  belongs_to :item
  respond_to :json, :only => [:index, :create]
  
  def create
    create! { root_path}
  end
end