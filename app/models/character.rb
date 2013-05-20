class Character < ActiveRecord::Base
  attr_accessible :gender, :name, :species, :location_id
  
  has_one :profile
  has_one :ship
  belongs_to :location
  has_many :properties
  
  has_many :possessions, :as => :ownable
  has_many :wares, :as => :vendable
  
  PLAYER_ATTRIBUTES = [:compassion, :courage, :dependability,
                       :endurance, :honesty, :honor,             
                       :charisma, :leadership, :logistics, 
                       :perception, :pilot, :quickness, 
                       :tactical, :technical, :wit]
                       
  PLAYER_TURNS = 2016
  
  include Owning
  #include Transactionable
  
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
  
  def inventory_items
    character_inventory_items
  end
  
  def initialize_inventory_item(good, quantity)
    character_inventory_items.create!(good_id: good.id, quantity: quantity) 
  end

  def increase_inventory_item(good, quantity)
    add_good(good, quantity)
  end
  
  # def quantity_of(good)
  #   character_inventory_items.find_by_good_id(good.id) ? character_inventory_items.find_by_good_id(good.id).quantity : 0
  # end
  
  # def buy_good(good, quantity)
  #   stock(good, quantity)
  # end
  
  # def valid_quantity?(good, quantity)
  #   character_inventory_items.find_by_good_id(good.id) && quantity_of(good) >= quantity
  # end
  
  # def sell_good(good, quantity)
  #   if valid_quantity?(good, quantity)
  #     item = character_inventory_items.find_by_good_id(good.id)
  #     updated_quantity = item.quantity - quantity
  #     item.update_attribute(:quantity, updated_quantity)
  #   else
  #     false #mark review - should these be exceptions instead?
  #   end
  # end

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