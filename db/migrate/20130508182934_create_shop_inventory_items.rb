class CreateShopInventoryItems < ActiveRecord::Migration
  def change
    create_table :shop_inventory_items do |t|
      t.integer :shop_id
      t.string :material
      t.integer :buy_price
      t.integer :sell_price

      t.timestamps
    end
  end
end
