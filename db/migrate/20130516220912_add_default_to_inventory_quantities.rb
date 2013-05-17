class AddDefaultToInventoryQuantities < ActiveRecord::Migration
  def up
    change_column_default(:shop_inventory_items, :quantity, 0)
    change_column_default(:character_inventory_items, :quantity, 0)
    CharacterInventoryItem.where(quantity: nil).update_all(quantity: 0)
    ShopInventoryItem.where(quantity: nil).update_all(quantity: 0)
  end
  
  def down
    
  end
end
