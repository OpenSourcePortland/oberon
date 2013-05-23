class RemoveInventoryItemsTables < ActiveRecord::Migration
  def up
    drop_table :shop_inventory_items
    drop_table :character_inventory_items
  end

  def down
    add_table :shop_inventory_items
    add_table :character_inventory_items
  end
end
