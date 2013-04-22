class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :location_type
      t.integer :size
      t.integer :spaceport_size
      t.integer :coordinates

      t.timestamps
    end
  end
end
