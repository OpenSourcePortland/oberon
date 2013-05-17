module Owning
  
  def add_good(good, quantity)
    possession = find_or_create_possession(good)
    manipulate_quantity(possession, quantity)
  end
  
  def reduce_good(good, quantity)
    possession = find_possession(good)
    if has_enough?(good, quantity)
      manipulate_quantity(possession, -quantity)
    end
  end
  
  def has_any?(good)
    has_enough?(good, 1)
  end
  
  def has_enough?(good, quantity)
    possession = find_possession(good)
    possession && possession.quantity >= quantity
  end
  
  private
  
  def manipulate_quantity(possession, quantity)
    possession.update_attributes(quantity: possession.quantity + quantity)
    possession.check_for_destroy
  end

  def find_possession(good)
    possessions.find_by_good_id(good)
  end
  
  def find_or_create_possession(good)
    possessions.find_or_create_by_good_id(good)
  end
  
end