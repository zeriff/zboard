class AddAuthorToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :author, :string,  default: ""
  end
end
