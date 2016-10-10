class Fixcolumname < ActiveRecord::Migration[5.0]
  def self.up
      rename_column :pins, :desription, :description
  end
end
