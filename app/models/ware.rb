class Ware < ActiveRecord::Base
  attr_accessible :buy_price, :good_id, :quantity, :sell_price, :vendable_id, :vendable_type
  
  belongs_to :vendable, polymorphic: :true
  
  def should_be_destroyed?
    false
  end
end
