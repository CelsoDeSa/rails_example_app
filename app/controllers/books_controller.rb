class BooksController < InheritedResources::Base
  before_action :authenticate_admin_user!, only: [:new, :edit, :update, :destroy]
  before_action :find_by_slug

  def find_by_slug
    @book = Book.find_by slug: params[:book_slug]
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
    @book = Book.find_by slug: params[:book_slug]

    if @book.update(book_params)
      redirect_to post_slug_path(params[:post_slug])
    else
      render :edit
    end
  end

  def destroy
    @book = Book.find_by slug: params[:book_slug]
    @book.destroy
  
    redirect_to post_slug_path(params[:post_slug])
  end

  private

    def book_params
      params.require(:book).permit(:title, :slug, :rating, :author, :isbn, :video, :image, :price, :buy_option_amazon, :description, :published, :post_id)
    end
end

