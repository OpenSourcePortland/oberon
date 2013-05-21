module Vending
  def buy_price(good)
    find_ware(good).buy_price
  end
  
  def stock(good, quantity, buy_price, sell_price)
    ware = find_or_create_ware(good)
    ware.update_attributes(buy_price: buy_price, sell_price: sell_price, quantity: quantity)
  end
  
  def restock(good, quantity)
    ware = find_ware(good)
    ware.update_attributes(quantity: ware.quantity + quantity)
  end

  def sell_price(good)
    find_ware(good).sell_price
  end
  
  ### all of these are duplicates...
  
  def ware_quantity_of(good)
    ware = find_ware(good)
    ware ? ware.quantity : 0
  end
  
  def ware_has_any?(good)
    ware_has_enough?(good, 1)
  end
  
  def ware_has_enough?(good, quantity)
    ware = find_ware(good)
    ware && ware.quantity >= quantity
  end
  
  private
  
  def find_ware(good)
    wares.find_by_good_id(good.id)
  end
  
  def find_or_create_ware(good)
    wares.find_or_create_by_good_id(good.id)
  end
end

=begin

we also need to add these

sell_good(good, quantity)
buy_good(good, quantity)


=end