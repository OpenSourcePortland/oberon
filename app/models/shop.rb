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
  end
  
  def quantity_of(good)
  end
  
  def trades_in?(good)
  end
  
  def has_stock_of?(good)
  end
  
  def sell(good, quantity)
  end
  
  def buy(good, quantity)
  end
  
end
