class ChangeSizeToNotReserverdWord < ActiveRecord::Migration
  def up
   rename_column :ships, :size, :ship_size
   rename_column :locations, :size, :location_size
  end

  def down
    rename_column :ships, :ship_size, :size
    rename_column :locations, :location_size, :size
  end
end
