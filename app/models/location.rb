class Location < ActiveRecord::Base
  attr_accessible :category, :name
  
  has_many :properties
end
