module Transactionable
  
  # stock method needs work
  # still need to test buttons in view
  
  # def has_enough?(good, quantity)
  #   inventory_item(good).quantity >= quantity
  # end
  # 
  # def inventory_item(good)
  #   inventory_items.find_by_good_id(good.id)
  # end
  # 
  # def inventory_items
  #   raise "Abstract method inventory_items called"
  # end
  # 
  # def add_good(good, quantity)
  #   inventory_item(good).update_attributes(quantity: inventory_item(good).quantity + quantity)
  # end
  # 
  # def reduce_good(good, quantity)
  #   inventory_item(good).update_attributes(quantity: inventory_item(good).quantity - quantity)
  # end
  # 
  # def quantity_of(good)
  #   inventory_item(good).quantity
  # end
  # 
  # def has_stock_of?(good)
  # inventory_item(good) &&  quantity_of(good) > 0 
  # end
end

=begin

def find_or_create(good)
  if item = shop_inventory_items.find_by_good_id(good.id)
    item
  else
    ShopInventoryItem.create!(shop_id: self.id, good_id: good.id, quantity: 0) 
    #mark review - we have to set quantity at 0 so its not nil, should we set the default to 0 in the migration?
  end
end
=end