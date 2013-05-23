class Good < ActiveRecord::Base
  attr_accessible :name
  
  has_many :shops, :through => :shop_inventory_items
  has_many :shop_inventory_items
  has_many :character_inventory_items
  has_many :characters, :through => :character_inventory_items
  
end
