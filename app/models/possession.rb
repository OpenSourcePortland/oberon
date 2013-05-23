class Possession < ActiveRecord::Base
  attr_accessible :good_id, :ownable_id, :ownable_type, :quantity
  
  belongs_to :ownable, polymorphic: true
  
  def should_be_destroyed?
    quantity <= 0 
  end
end
