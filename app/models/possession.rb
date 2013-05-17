class Possession < ActiveRecord::Base
  attr_accessible :good_id, :ownable_id, :ownable_type, :quantity
  
  belongs_to :ownable, polymorphic: true
  
  
  def check_for_destroy
    if quantity <= 0
      self.destroy
    end
  end
end
