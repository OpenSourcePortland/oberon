class ShopInventoryItem < ActiveRecord::Base
  attr_accessible :buy_price, :good_id, :sell_price, :shop_id, :quantity
  
  belongs_to :shop, :dependent => :destroy
  belongs_to :good, :dependent => :destroy

end
