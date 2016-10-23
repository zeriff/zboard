class AddIsAnAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_an_admin, :boolean, default: false
  end
end
