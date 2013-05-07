require 'spec_helper'

describe Character do
  before(:each) do
    @character = Fabricate(:character)
  end
  
  it "should increase turns_spent by one each turn" do
    expect{@character.increment_turn}.to change{@character.turns_spent}.by(1)
  end
  
  it "should calculate turns_remaining" do
    expect(@character.turns_remaining).to eq(Character::PLAYER_TURNS)
  end
  
  it "should end game when turns_spent equals PLAYER_TURNS" do
    @character.turns_spent = Character::PLAYER_TURNS
    expect(@character.game_over?).to be_true
  end
  
  it 
  
end