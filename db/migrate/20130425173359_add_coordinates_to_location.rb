class AddCoordinatesToLocation < ActiveRecord::Migration
  def change
    add_column :locations, :x, :integer
    add_column :locations, :y, :integer
    add_column :locations, :z, :integer
  end
end
