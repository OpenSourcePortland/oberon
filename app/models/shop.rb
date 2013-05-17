class Shop < ActiveRecord::Base
  attr_accessible :location_id, :name
  
  belongs_to :location, dependent: :destroy
  
  has_many :shop_inventory_items
  has_many :goods, :through => :shop_inventory_items
  
  has_many :possessions, as: :ownable
  #has_many :stock_items, :as => :stockable
  
  include Transactionable
  include Owning
  
  def inventory_items
    shop_inventory_items
  end
  
  def trades_in?(good)
    shop_inventory_items.find_by_good_id(good.id)
  end
  
  def buy_price_of(good)
    shop_inventory_items.find_by_good_id(good.id).buy_price
  end

  def sell_price_of(good)
    shop_inventory_items.find_by_good_id(good.id).sell_price
  end
  
  # need to add find or create to only this method
  def stock(good, buy_price, sell_price, quantity)
    item = create_inventory_item(good)
    item.update_attributes(buy_price: buy_price,
    sell_price: sell_price, quantity: quantity)
  end
  
  def restock(good, quantity)
    add_good(good, quantity)
  end

  def create_inventory_item(good)
    shop_inventory_items.create!(good_id: good.id)
  end
end
