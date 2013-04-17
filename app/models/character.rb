class Character < ActiveRecord::Base
  attr_accessible :gender, :name, :species #:profile_attributes, :profiles_attributes
  
  has_one :profile
  has_many :ships
  
  # accepts_nested_attributes_for :profile
end

def create_initial_ships
  Ship.create!(:name => 'falcon', :ship_type => 'fighter', :price => '500', :size => '10')
  Ship.create!(:name => 'firefly', :ship_type => 'miner', :price => '100', :size => '5')
  Ship.create!(:name => 'obergone', :ship_type => 'farmer', :price => '200', :size => '2') 
end



