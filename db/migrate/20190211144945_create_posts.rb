class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :slug
      t.text :intro
      t.boolean :published

      t.timestamps
    end
  end
end
