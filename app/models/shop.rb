class Shop < ActiveRecord::Base
  attr_accessible :location_id, :name
  
  belongs_to :location, dependent: :destroy
  
  has_many :possessions, as: :ownable
  has_many :wares, :as => :vendable

  #include Owning
  #include Vending
  

  include Transactionable
  
  def inventory_items
    wares
  end
  
  def buy_price(good)
    find_item(good).buy_price
  end
  
  def stock(good, quantity, buy_price, sell_price)
    ware = find_or_create_item(good)
    ware.update_attributes(buy_price: buy_price, sell_price: sell_price, quantity: quantity)
  end
  
  def restock(good, quantity)
    ware = find_item(good)
    ware.update_attributes(quantity: ware.quantity + quantity)
  end

  def sell_price(good)
    find_item(good).sell_price
  end  
  
  def trades_in?(good)
    find_item(good)
  end
  
  def will_buy?(good)
    trades_in?(good)
  end

end
