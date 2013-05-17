class CreatePossessions < ActiveRecord::Migration
  def change
    create_table :possessions do |t|
      t.integer :quantity, default: 0
      t.integer :good_id
      t.integer :ownable_id
      t.string :ownable_type

      t.timestamps
    end
    add_index :possessions, [:good_id, :ownable_id]
    add_index :possessions, [:ownable_id, :good_id]
  end
end
