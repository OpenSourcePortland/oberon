require 'spec_helper'

describe Character do
  before(:each) do
    @character = Fabricate(:character)
    @good = Fabricate(:good)
    @character.stock(@good, 100)
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
  
  describe "#stock" do
  
    it "should stock the good" do
      good = Fabricate(:good)
      @character.stock(good, 10)
      expect(@character.quantity_of(good)).to eq(10)
    end
    
    it "should increase the quantity if the good is already in stock" do
      good = Fabricate(:good)
      @character.stock(good, 10)
      @character.stock(good, 10)
      expect(@character.quantity_of(good)).to eq(20)
    end
    
  end
    
  describe "when buying and selling goods" do
    
    it "#buy_good should increase the quantity of the good by quantity purchased" do   
      expect{@character.buy_good(@good, 10)}.to change{@character.quantity_of(@good)}.by(10)
    
    end
    
    it "#buy_good should reduce the character 'cash' value" do
      pending
    end
    
    it "#sell_good should reduce the quantity of the good by quantity sold" do    
      expect{@character.sell_good(@good, 10)}.to change{@character.quantity_of(@good)}.by(-10)
    
    end
    
    it "#sell_good should return false if they don't have enough of that good" do
      expect(@character.sell_good(@good, 1000)).to be_false
    end
    
    
  end
    
end