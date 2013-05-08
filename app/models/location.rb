class Location < ActiveRecord::Base
  attr_accessible :category, :name, :x, :y, :z
  
  has_many :properties
  has_many :shops
  
  validates :x, :y, :z, :presence => true
  
  def distance_to(destination)
    a = self.x - destination.x
    b = self.y - destination.y
    c = self.z - destination.z
    Math.sqrt(a**2 + b**2 + c**2).round
  end
end
