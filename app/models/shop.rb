class Shop < ActiveRecord::Base
  attr_accessible :location_id, :name
  
  belongs_to :location, :dependent => :destroy
  
  has_many :shop_inventory_items
  has_many :goods, :through => :shop_inventory_items
  
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
  
  def buy_price_of(good)
    shop_inventory_items.find_by_good_id(good.id).buy_price
  end
  
  def sell_price_of(good)
    shop_inventory_items.find_by_good_id(good.id).sell_price
  end
  
  def quantity_of(good)
    shop_inventory_items.find_by_good_id(good.id).quantity
  end
  
  def trades_in?(good)
    shop_inventory_items.find_by_good_id(good.id)
  end
  
  def has_stock_of?(good)
    shop_inventory_items.find_by_good_id(good.id) && shop_inventory_items.find_by_good_id(good.id).quantity > 0
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
  
end
