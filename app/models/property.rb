class Property < ActiveRecord::Base
  attr_accessible :character_id, :location_id, :name, :output_rate, :price, :property_type, :renewable, :resource_count
  
  belongs_to :location
  belongs_to :character
  has_many :materials
end
