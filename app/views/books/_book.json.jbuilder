<<<<<<< HEAD
json.extract! book, :id, :title, :slug, :asin, :video, :image, :price, :buy_option_amazon, :description, :published, :post_id, :created_at, :updated_at
=======
json.extract! book, :id, :title, :slug, :asin, :video, :price, :buy_option_amazon, :description, :published, :post_id, :created_at, :updated_at
>>>>>>> a0fb20c7e4bcbcd39e7747e1b4a45cd39c39c446
json.url book_url(book, format: :json)
