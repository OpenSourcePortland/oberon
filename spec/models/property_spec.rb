require 'spec_helper'

describe Property do
  
  before(:each) do
    @property = Fabricate(:property)
  end
  
  it "#claimed? should return true if the property is claimed by a character" do
    expect(@property).to be_claimed
  end
  
  it "#claimed? should return false if the property is not claimed" do
    @property.character_id = nil
    @property.save!
    expect(@property.claimed?).to be_false
  end
  
end