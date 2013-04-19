class Location < ActiveRecord::Base
  attr_accessible :coordinates, :location_type, :name, :location_size, :spaceport_size
  
  has_many :properties
end
