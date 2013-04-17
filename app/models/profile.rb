class Profile < ActiveRecord::Base
  attr_accessible :compassion_level, :courage_level, :dependability_level,
                      :endurance_level, :honesty_level, :honor_level,             
                      :interpersonal_level, :leadership_level, :logistics_level, 
                      :perception_level, :pilot_level, :reflex_level, 
                      :tactical_level, :technical_level, :wit_level, :character_id
      
  belongs_to :character
  
end
