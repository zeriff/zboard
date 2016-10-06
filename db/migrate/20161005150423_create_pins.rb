class CreatePins < ActiveRecord::Migration[5.0]
  def change
    create_table :pins do |t|
      t.string :title
      t.text :desription
      t.string :pin_url      
      t.timestamps
    end
  end
end
