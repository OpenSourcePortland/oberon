class Ship < ActiveRecord::Base
  attr_accessible :name, :character_id
  
  belongs_to :character
end
