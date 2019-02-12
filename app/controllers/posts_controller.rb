class PostsController < InheritedResources::Base
  before_action :authenticate_admin_user!, only: [:new, :update, :destroy]

  private

    def post_params
      params.require(:post).permit(:title, :slug, :intro, :published)
    end
end

