class RemoveColumnsFromProperties < ActiveRecord::Migration
  def up
    remove_column :properties, :property_type
    remove_column :properties, :resource_count
    remove_column :properties, :output_rate
    remove_column :properties, :renewable
  end

  def down
    add_column :properties, :property_type, :string
    add_column :properties, :resource_count, :integer
    add_column :properties, :output_rate, :integer
    add_column :properties, :renewable, :boolean
  end
end