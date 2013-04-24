class Character < ActiveRecord::Base
  attr_accessible :gender, :name, :species, :location_id #:profile_attributes, :profiles_attributes
  
  has_one :profile
  has_many :ships
  belongs_to :location
  has_many :properties
  
  PLAYER_ATTRIBUTES = [:compassion, :courage, :dependability,
                       :endurance, :honesty, :honor,             
                       :charisma, :leadership, :logistics, 
                       :perception, :pilot, :quickness, 
                       :tactical, :technical, :wit]

  # accepts_nested_attributes_for :profile
end