class Shop < ActiveRecord::Base
  attr_accessible :location_id, :name
  
  belongs_to :location, :dependent => :destroy
  
  has_many :shop_inventory_items
end
