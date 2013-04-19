class Ship < ActiveRecord::Base
  attr_accessible :name, :price, :ship_type, :ship_size, :character_id
  
  belongs_to :character
end
