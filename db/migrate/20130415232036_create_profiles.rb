class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :technical_level, :default => 0
      t.integer :pilot_level, :default => 0
      t.integer :logistics_level, :default => 0
      t.integer :tactical_level, :default => 0
      t.integer :interpersonal_level, :default => 0
      t.integer :wit_level, :default => 0
      t.integer :reflex_level, :default => 0
      t.integer :endurance_level, :default => 0
      t.integer :perception_level, :default => 0
      t.integer :leadership_level, :default => 0
      t.integer :honesty_level, :default => 0
      t.integer :compassion_level, :default => 0
      t.integer :courage_level, :default => 0
      t.integer :honor_level, :default => 0
      t.integer :dependability_level, :default => 0
      t.integer :character_id

      t.timestamps
    end
  end
end
