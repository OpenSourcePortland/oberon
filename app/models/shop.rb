class Shop < ActiveRecord::Base
  attr_accessible :location_id, :name
  
  belongs_to :location, dependent: :destroy
  
  has_many :possessions, as: :ownable
  has_many :wares, :as => :vendable

  include Owning
  #include Transactionable
  
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

end
