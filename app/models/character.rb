class Character < ActiveRecord::Base
  attr_accessible :gender, :name, :species
  
  has_one :profile
  has_many :ships
end



