class PostsController < InheritedResources::Base
  before_action :authenticate_admin_user!, only: [:new, :update, :destroy]
  before_action :find_post_by_slug

  def find_post_by_slug
    @post = Post.find_by slug: params[:slug]
  end

  private

    def post_params
      params.require(:post).permit(:title, :slug, :intro, :published)
    end
end