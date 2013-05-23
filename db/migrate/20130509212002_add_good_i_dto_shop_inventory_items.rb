class AddGoodIDtoShopInventoryItems < ActiveRecord::Migration
  def up
    remove_column :shop_inventory_items, :material
    add_column :shop_inventory_items, :good_id, :integer
    add_column :shop_inventory_items, :quantity, :integer
  end

  def down
    add_column :shop_inventory_items, :material, :string
    remove_column :shop_inventory_items, :good_id
    remove_column :shop_inventory_items, :quantity
  end
end
