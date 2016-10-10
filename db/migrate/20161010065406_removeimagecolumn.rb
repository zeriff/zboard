class Removeimagecolumn < ActiveRecord::Migration[5.0]
  def self.up
      remove_column :pins, :image
    end
end
