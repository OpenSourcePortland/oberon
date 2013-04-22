class Profile < ActiveRecord::Base
  attr_accessible :compassion, :courage, :dependability,
                  :endurance, :honesty, :honor,             
                  :charisma, :leadership, :logistics, 
                  :perception, :pilot, :quickness, 
                  :tactical, :technical, :wit, :character_id
      
  belongs_to :character
  
  PLAYER_ATTRIBUTES = [:compassion, :courage, :dependability,
                       :endurance, :honesty, :honor,             
                       :charisma, :leadership, :logistics, 
                       :perception, :pilot, :quickness, 
                       :tactical, :technical, :wit]

end
