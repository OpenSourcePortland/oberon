class CharacterInventoryItem < ActiveRecord::Base
  attr_accessible :character_id, :good_id, :quantity
  
  belongs_to :good
  belongs_to :character
  
  validates :good_id, :uniqueness => { :scope => :character_id,
      :message => "can only be assigned once to each a character" }
  
end
