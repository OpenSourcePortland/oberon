class ShopInventoryItem < ActiveRecord::Base
  attr_accessible :buy_price, :material, :sell_price, :shop_id
  
  belongs_to :shop, :dependent => :destroy
end
