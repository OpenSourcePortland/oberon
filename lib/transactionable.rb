module Transactionable
  
  # stock method needs work
  # memoizing is causing issues in tests... possibly also in space?
  # need to look at wich methods we can now delete from Character.rb
  # still need to test buttons in view
  
  def has_enough?(good, quantity)
    inventory_item(good).quantity >= quantity
  end
  
  # this needs to be changed to not create if can't find
  def inventory_item(good)
    @inventory_item ||= inventory_items.find_or_create_by_good_id(good.id) 
  end
  
  def inventory_items
    raise "Abstract method inventory_items called"
  end
  
  def add_good(good, quantity)
    inventory_item(good).update_attributes(quantity: inventory_item(good).quantity + quantity)
  end
  
  def reduce_good(good, quantity)
    inventory_item(good).update_attributes(quantity: inventory_item(good).quantity - quantity)
  end
  
  # need to add find or create to only this method
  def stock(good, buy_price = nil, sell_price = nil, quantity)
    item = inventory_item(good)
    updated_quantity = item.quantity + quantity
    item.update_attribute(:buy_price, buy_price) if buy_price
    item.update_attribute(:sell_price, sell_price) if sell_price
    item.update_attribute(:quantity, updated_quantity)
  end
  
  def quantity_of(good)
    inventory_item(good).quantity
  end
  
  def has_stock_of?(good)
  inventory_item(good) &&  quantity_of(good) > 0 
  end
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

def stock(good, buy_price = nil, sell_price = nil, quantity)
  item = find_or_create(good)
  updated_quantity = item.quantity + quantity
  item.update_attribute(:buy_price, buy_price) if buy_price
  item.update_attribute(:sell_price, sell_price) if sell_price
  item.update_attribute(:quantity, updated_quantity)
  #mark review - the idea here is we may want to restock the item without setting a new buy and sell price - does this make sense?
end








def valid_quantity?(good, quantity)
  shop_inventory_items.find_by_good_id(good.id) && quantity_of(good) >= quantity
end

# mark review - we can't decide on raising errors or soft fail for these kinds of methods. 
def sell(character, good, quantity)
  if valid_quantity?(good, quantity)
    item = shop_inventory_items.find_by_good_id(good.id)
    item.quantity -= quantity
    item.save!
    character.buy_good(good, quantity)
   else 
     false
   end
end

def buy(character, good, quantity)
  if character.sell_good(good, quantity)
    item = shop_inventory_items.find_by_good_id(good.id)
    item.quantity += quantity
    item.save!
  else
    false
  end
end

=end