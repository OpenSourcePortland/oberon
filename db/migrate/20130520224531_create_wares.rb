class CreateWares < ActiveRecord::Migration
  def change
    create_table :wares do |t|
      t.integer :good_id
      t.integer :buy_price
      t.integer :sell_price
      t.integer :quantity, default: 0
      t.integer :vendable_id
      t.string  :vendable_type

      t.timestamps
    end
  end
end
