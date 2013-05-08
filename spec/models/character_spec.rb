require 'spec_helper'

describe Character do
  before(:each) do
    @character = Fabricate(:character)
    @destination = Fabricate(:location)
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
  
  it "should calculate turns used for traveling distance" do
    expect(@character.calc_turns_required(100)).to eq(1)
  end
  
  it "#enough_turns? should return false if the player does not have enough turns" do
    @character.turns_spent = 2007
    expect(@character.enough_turns?(10)).to be_false
  end
  
  it "should decrease turns by proper amount when traveling" do
    @character.turns_spent = 0
    expect{@character.travel(@destination, 100)}.to change{@character.turns_spent}.by(1)
  end
  
  it "should return false if there are not enough turns to travel the distance" do
    @character.turns_spent = 2016
    expect(@character.travel(@destination, 100)).to be_false
  end
  
  it "should update the location when traveling" do
    @character.turns_spent = 0
    @character.travel(@destination, 100)
    expect(@character.location).to be(@destination)
  end
end
