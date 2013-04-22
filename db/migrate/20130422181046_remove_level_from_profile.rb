class RemoveLevelFromProfile < ActiveRecord::Migration
  def change
    rename_column :profiles, :technical_level, :technical
    rename_column :profiles, :pilot_level, :pilot
    rename_column :profiles, :logistics_level, :logistics
    rename_column :profiles, :tactical_level, :tactical 
    rename_column :profiles, :interpersonal_level, :charisma 
    rename_column :profiles, :wit_level, :wit 
    rename_column :profiles, :reflex_level, :quickness 
    rename_column :profiles, :endurance_level, :endurance 
    rename_column :profiles, :perception_level, :perception 
    rename_column :profiles, :leadership_level, :leadership 
    rename_column :profiles, :honesty_level, :honesty
    rename_column :profiles, :compassion_level, :compassion
    rename_column :profiles, :courage_level, :courage 
    rename_column :profiles, :honor_level, :honor
    rename_column :profiles, :dependability_level, :dependability 
  end
end


  