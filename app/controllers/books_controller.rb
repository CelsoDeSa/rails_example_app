class BooksController < InheritedResources::Base

  private

    def book_params
      params.require(:book).permit(:title, :slug, :asin, :video, :price, :buy_option_amazon, :description, :published, :post_id)
    end
end

