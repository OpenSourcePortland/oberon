class RemoveFieldsFromLocation < ActiveRecord::Migration
  def up
    rename_column :locations, :location_type, :category
    remove_column :locations, :location_size
    remove_column :locations, :spaceport_size
    remove_column :locations, :coordinates
  end

  def down
    rename_column :locations, :category, :location_type 
    add_column :locations, :location_size, :integer
    add_column :locations, :spaceport_size, :integer
    add_column :locations, :coordinates, :integer
  end
end
