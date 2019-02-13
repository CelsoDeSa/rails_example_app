class BooksController < InheritedResources::Base
  before_action :authenticate_admin_user!, only: [:new, :update, :destroy]
  before_action :find_post_by_id

  def find_post_by_id
    @post = Post.find(params[:post_id])
  end

  private

    def book_params
      params.require(:book).permit(:title, :slug, :isbn, :video, :image, :price, :buy_option_amazon, :description, :published, :post_id)
    end
end

