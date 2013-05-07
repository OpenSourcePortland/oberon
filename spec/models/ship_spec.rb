require 'spec_helper'

describe Ship do
  
  before(:each) do
    @ship = Fabricate(:ship)
  end
  
  it "#decrease_fuel should decrease fuel" do
    expect{@ship.decrease_fuel(1)}.to change{@ship.fuel}.by(-1)
  end
  
  it "#enough_fuel? should return true if enough fuel available" do
    @ship.fuel = 15
    expect(@ship.enough_fuel?(10)).to be_true
  end
  
  it "#enough_fuel? should return false if not enough fuel available" do
    @ship.fuel = 5
    expect(@ship.enough_fuel?(10)).to be_false
  end  
  
  it "should calculate fuel usage" do
    expect(@ship.calc_fuel_usage(200)).to eq(2) 
  end
  
  it "should decrease fuel by proper amount when traveling" do
    expect{@ship.fly(200)}.to change{@ship.fuel}.by(-2)
  end
  
  
end