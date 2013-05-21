require 'spec_helper'

shared_examples "vending" do
  before(:each) do
    @good = Fabricate(:good)
  end
  
  it "#buy_price returns the buy_price of the good" do
    @vendor.stock(@good, 10, 5, 6)
    expect(@vendor.buy_price(@good)).to eq(5)
  end
  
  it "#sell_price returns the sell price of the good" do
    @vendor.stock(@good, 10, 5, 6)
    expect(@vendor.sell_price(@good)).to eq(6)
  end
  
  it "#stock should stock the good" do
    expect{@vendor.stock(@good, 100, 20, 30)}.to change{@vendor.ware_quantity_of(@good)}.by(100)
  end
  
  it "#restock should increase the quantity of an existing good" do
    new_good = Fabricate(:good)
    @vendor.stock(new_good, 10, 5, 7)
    expect{@vendor.restock(new_good, 20)}.to change{@vendor.ware_quantity_of(new_good)}.by(20)
  end
  
  it "#ware_has_any? should return true if the vendor has that good" do
    new_good = Fabricate(:good)
    @vendor.stock(new_good, 1, 1, 1)
    expect(@vendor.ware_has_any?(new_good)).to be_true
    expect(@vendor.ware_quantity_of(new_good)).to eq(1)
  end
  
  it "#ware_quantity_of returns the quantity of that good" do
    new_good = Fabricate(:good)
    @vendor.stock(new_good, 1, 1, 1)
    expect(@vendor.ware_quantity_of(new_good)).to eq(1)
  end 
  
end