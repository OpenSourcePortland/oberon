class Ship < ActiveRecord::Base
  attr_accessible :name, :character_id
  
  belongs_to :character
  
  def decrease_fuel(units)
    self.fuel -= units
  end
  
  def enough_fuel?(units)
    self.fuel >= units
  end
end
