class RemoveShipFields < ActiveRecord::Migration
  def up
    remove_column :ships, :ship_type
    remove_column :ships, :price
    remove_column :ships, :ship_size
  end 

  def down
    add_column :ships, :ship_type, :string
    add_column :ships, :price, :integer
    add_column :ships, :ship_size, :integer
  end 

end


