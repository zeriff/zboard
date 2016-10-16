class AddCategoryIdToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :category_id, :integer
  end
end
