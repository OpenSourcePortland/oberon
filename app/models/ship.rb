class Ship < ActiveRecord::Base
  attr_accessible :name, :character_id
  
  belongs_to :character
  
  DISTANCE_PER_FUEL_UNIT = 100
  
  def decrease_fuel(units)
    self.fuel -= units
  end
  
  def enough_fuel?(units)
    self.fuel >= units
  end
  
  def calc_fuel_usage(distance)
    distance / DISTANCE_PER_FUEL_UNIT
  end
  
  def fly(distance)
    fuel_used = calc_fuel_usage(distance)
    self.fuel -= fuel_used
  end
  
end
