class ShopInventoryItem < ActiveRecord::Base
  # attr_accessible :buy_price, :good_id, :sell_price, :shop_id, :quantity
  # 
  # belongs_to :shop, :dependent => :destroy
  # belongs_to :good, :dependent => :destroy
  # 
  # validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }, :allow_blank => true
  # 
  # 
  # #default_scope order('created_at DESC')
end
