class Shop < ActiveRecord::Base
  attr_accessible :location_id, :name
  
  belongs_to :location, :dependent => :destroy
end
