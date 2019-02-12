class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :slug
      t.string :asin
      t.string :video
      t.integer :price
      t.string :buy_option_amazon
      t.text :description
      t.boolean :published
      t.belongs_to :post, foreign_key: true

      t.timestamps
    end
  end
end
