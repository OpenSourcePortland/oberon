class Shop < ActiveRecord::Base
  attr_accessible :location_id, :name
  
  belongs_to :location, :dependent => :destroy
  
  has_many :shop_inventory_items
  has_many :goods, :through => :shop_inventory_items
  
  def stock(good, buy_price, sell_price, quantity)
    ShopInventoryItem.create!(shop_id: self.id, good_id: good.id, buy_price: buy_price, sell_price: sell_price, quantity: quantity)
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
  
  def sell(character, good, quantity)
    item = shop_inventory_items.find_by_good_id(good.id)
    item.quantity -= quantity  
    item.save
  end
  
  def buy(character, good, quantity)
    item = shop_inventory_items.find_by_good_id(good.id)
    item.quantity += quantity  
    item.save
  end
  
end
