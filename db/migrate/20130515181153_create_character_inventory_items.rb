class CreateCharacterInventoryItems < ActiveRecord::Migration
  def change
    create_table :character_inventory_items do |t|
      t.integer :character_id
      t.integer :good_id
      t.integer :quantity

      t.timestamps
    end
  end
end
