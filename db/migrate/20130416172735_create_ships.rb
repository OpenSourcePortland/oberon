class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
      t.integer :character_id
      t.string :name
      t.string :ship_type
      t.integer :price
      t.integer :size

      t.timestamps
    end
  end
end
