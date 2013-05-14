class CreateMaterials < ActiveRecord::Migration
  def change
    create_table :materials do |t|
      t.integer :good_id
      t.integer :output_rate
      t.integer :quantity
      t.boolean :renewable
      t.integer :property_id

      t.timestamps
    end
  end
end
