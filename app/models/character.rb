class Character < ActiveRecord::Base
  attr_accessible :gender, :name, :species
  
  has_one :profile
end
