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
    if enough_fuel?(fuel_used)
      self.fuel -= fuel_used
      true
    else
      false
    end
  end

  # hard error version of the fly method - may want to use this later
  # def fly!(distance)
  #   fuel_used = calc_fuel_usage(distance)
  #   if enough_fuel?(fuel_used)
  #     self.fuel -= fuel_used
  #   else
  #     raise "not enough fuel"
  #   end
  # end  
  
end
