class Ship < ActiveRecord::Base
  attr_accessible :character_id, :name, :price, :ship_type, :size
  
  belongs_to :character
end
