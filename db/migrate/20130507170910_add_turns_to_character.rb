class AddTurnsToCharacter < ActiveRecord::Migration
  def change
    add_column :characters, :turns_spent, :integer, :default => 0
  end
end
