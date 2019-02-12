class BooksController < InheritedResources::Base
  before_action :authenticate_admin_user!, only: [:new, :update, :destroy]

  private

    def book_params
      params.require(:book).permit(:title, :slug, :asin, :video, :price, :buy_option_amazon, :description, :published, :post_id)
    end
end

