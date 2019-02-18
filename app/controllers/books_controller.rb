class BooksController < InheritedResources::Base
  before_action :authenticate_admin_user!, only: [:new, :update, :destroy]
  before_action :find_post_by_slug

  def find_post_by_slug
    @post = Post.find_by slug: params[:slug]
  end

  def create
    @book = Book.new(book_params)

    if @book.save
      redirect_to post_slug_path(params[:post_slug])
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])

    if @book.update(book_params)
      redirect_to post_slug_path(params[:post_slug])
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
  
    redirect_to post_slug_path(params[:post_slug])
  end

  private

    def book_params
      params.require(:book).permit(:title, :slug, :isbn, :video, :image, :price, :buy_option_amazon, :description, :published, :post_id)
    end
end

