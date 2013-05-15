class Character < ActiveRecord::Base
  attr_accessible :gender, :name, :species, :location_id #:profile_attributes, :profiles_attributes
  
  has_one :profile
  has_many :ships
  belongs_to :location
  has_many :properties
  has_many :character_inventory_items
  has_many :goods, :through => :character_inventory_items
  
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
  
  def find_or_create(good)
    if item = character_inventory_items.find_by_good_id(good.id)
      item
    else
      CharacterInventoryItem.create!(character_id: self.id, good_id: good.id, quantity: 0) 
      #mark review - we have to set quantity at 0 so its not nil, should we set the default to 0 in the migration?
    end
  end
  
  def stock(good, quantity)
    item = find_or_create(good)
    item.quantity += quantity
    item.save!
  end
  
  def quantity_of(good)
    character_inventory_items.find_by_good_id(good.id).quantity
  end
  
  def buy_good(good, quantity)
    stock(good, quantity)
  end
  
  def valid_quantity?(good, quantity)
    character_inventory_items.find_by_good_id(good.id) && character_inventory_items.find_by_good_id(good.id).quantity >= quantity
  end
  
  def sell_good(good, quantity)
    if valid_quantity?(good, quantity)
      item = character_inventory_items.find_by_good_id(good.id)
      updated_quantity = item.quantity - quantity
      item.update_attribute(:quantity, updated_quantity)
    else
      false
    end
  end

end