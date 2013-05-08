class Character < ActiveRecord::Base
  attr_accessible :gender, :name, :species, :location_id #:profile_attributes, :profiles_attributes
  
  has_one :profile
  has_many :ships
  belongs_to :location
  has_many :properties
  
  PLAYER_ATTRIBUTES = [:compassion, :courage, :dependability,
                       :endurance, :honesty, :honor,             
                       :charisma, :leadership, :logistics, 
                       :perception, :pilot, :quickness, 
                       :tactical, :technical, :wit]
                       
  PLAYER_TURNS = 2016
  
  def increment_turn(turns)
    self.turns_spent += turns
  end
  
  def turns_remaining
    PLAYER_TURNS - self.turns_spent
  end
  
  def game_over?
    turns_remaining == 0 #true
  end

end