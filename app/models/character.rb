class Character < ActiveRecord::Base
  attr_accessible :gender, :name, :species, :location_id #:profile_attributes, :profiles_attributes
  
  has_one :profile
  has_one :ship
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

  def current_ship
    ship
  end
  
  def turns_remaining
    PLAYER_TURNS - self.turns_spent
  end
  
  def game_over?
    turns_remaining == 0 #true
  end

  def enough_turns?(turns_required)
    turns_remaining >= turns_required
  end
  
  def travel(destination)
    turns_required = current_ship.time_to_travel_to(destination)
    if enough_turns?(turns_required)
      increment_turn(turns_required)
      self.location = destination
      self.save!
    else
      false
    end
  end

end