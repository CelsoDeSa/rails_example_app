json.extract! book, :id, :title, :slug, :asin, :video, :image, :price, :buy_option_amazon, :description, :published, :post_id, :created_at, :updated_at
json.url book_url(book, format: :json)
