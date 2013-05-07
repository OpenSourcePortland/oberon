class AddFuelToShips < ActiveRecord::Migration
  def change
    add_column :ships, :fuel, :integer, :default => 0
  end
end
