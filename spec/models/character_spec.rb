require 'spec_helper'

describe Character do
  before(:each) do
    @character = Fabricate(:character)
    @good = Fabricate(:good)
    @character.initialize_inventory_item(@good, 100)
  end
  
  it "should increase turns_spent by one each turn" do
    expect{@character.increment_turn(1)}.to change{@character.turns_spent}.by(1)
  end
  
  it "should calculate turns_remaining" do
    expect(@character.turns_remaining).to eq(Character::PLAYER_TURNS)
  end
  
  it "should end game when turns_spent equals PLAYER_TURNS" do
    expect(@character.game_over?).to be_false
    @character.turns_spent = Character::PLAYER_TURNS
    expect(@character.game_over?).to be_true
  end
  
  it "#quantity_of should return the correct quantity of that item" do
    expect(@character.quantity_of(@good)).to eq(100)
  end
  
  describe "#initialize_inventory_item" do
  
    it "should create inventory item for the good" do
      good = Fabricate(:good)
      @character.initialize_inventory_item(good, 10)
      expect(@character.quantity_of(good)).to eq(10)
    end
  end

    it "#increase_inventory_item should increase the quantity if the good is already in inventory" do
      good = Fabricate(:good)
      @character.initialize_inventory_item(good, 10)
      @character.increase_inventory_item(good, 10)
      expect(@character.quantity_of(good)).to eq(20)
    end   
  
end