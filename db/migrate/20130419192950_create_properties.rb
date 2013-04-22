class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :name
      t.string :property_type
      t.integer :resource_count
      t.integer :output_rate
      t.boolean :renewable
      t.integer :location_id
      t.integer :character_id
      t.integer :price

      t.timestamps
    end
  end
end
