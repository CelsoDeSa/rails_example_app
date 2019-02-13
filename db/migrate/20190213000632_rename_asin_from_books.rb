class RenameAsinFromBooks < ActiveRecord::Migration[5.2]
  def change
    change_table :books do |t|
      t.rename :asin, :isbn
    end
  end
end
