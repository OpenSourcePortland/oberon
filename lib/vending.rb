module Vending
  # def buy_price(good)
  #   find_ware(good).buy_price
  # end
  # 
  # def stock(good, quantity, buy_price, sell_price)
  #   ware = find_or_create_ware(good)
  #   ware.update_attributes(buy_price: buy_price, sell_price: sell_price, quantity: quantity)
  # end
  # 
  # def restock(good, quantity)
  #   ware = find_ware(good)
  #   ware.update_attributes(quantity: ware.quantity + quantity)
  # end
  # 
  # def sell_price(good)
  #   find_ware(good).sell_price
  # end  
  # 
  # def trades_in?(good)
  #   find_ware(good)
  # end
  # 
  # 
  # ### all of these are duplicates...
  # 
  # def quantity_of_ware(good)
  #   ware = find_ware(good)
  #   ware ? ware.quantity : 0
  # end
  # 
  # def has_any_ware?(good)
  #   has_enough_ware?(good, 1)
  # end
  # 
  # def has_enough_ware?(good, quantity)
  #   ware = find_ware(good)
  #   ware && ware.quantity >= quantity
  # end
  # 
  # # these seem a lot like add_good and reduce_good
  # def buy_good(good, quantity)
  #   ware = find_ware(good)
  #   ware.update_attributes(quantity: ware.quantity + quantity)
  # end
  # 
  # def sell_good(good, quantity)
  #   if has_enough_ware?(good, quantity)
  #     ware = find_ware(good)
  #     ware.update_attributes(quantity: ware.quantity - quantity)
  #   else
  #     false
  #   end
  # end
  # 
  # 
  # private
  # 
  # def find_ware(good)
  #   wares.find_by_good_id(good.id)
  # end
  # 
  # def find_or_create_ware(good)
  #   wares.find_or_create_by_good_id(good.id)
  # end

end

=begin

we also need to add these

sell_good(good, quantity)
buy_good(good, quantity)


=end