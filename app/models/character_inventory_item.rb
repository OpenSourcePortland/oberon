class CharacterInventoryItem < ActiveRecord::Base
  # attr_accessible :character_id, :good_id, :quantity
  # 
  # belongs_to :good
  # belongs_to :character
  # 
  # validates :quantity, :numericality => { :greater_than_or_equal_to => 0 }, :allow_blank => true
  # validates :good_id, :uniqueness => { :scope => :character_id,
  #     :message => "can only be assigned once to each a character" }
  # 
end
