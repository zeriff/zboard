class AddOembedStrToPins < ActiveRecord::Migration[5.0]
  def change
    add_column :pins, :oembed_str, :text, default: ""
    add_column :pins, :parent_provider, :string, default: ""
  end
end
