class Shop < ActiveRecord::Base
  attr_accessible :location_id, :name
  
  belongs_to :location, :dependent => :destroy
  
  has_many :shop_inventory_items
  has_many :goods, :through => :shop_inventory_items
  
  include Transactionable
  
  def inventory_items
    shop_inventory_items
  end
  
end
