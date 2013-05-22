require 'spec_helper'
#require 'support/owning_spec.rb'

describe Shop do
  before(:each) do
    @owner = Fabricate(:shop)
    @vendor = Fabricate(:shop) 
    @good = Fabricate(:good)
  end
  
  let(:character) { Fabricate(:character) }
  let(:shop) { @owner }
  
  #it_behaves_like "owning"
  #it_behaves_like "vending"
  it_behaves_like "transactionable"
  
  it "#buy_price returns the buy_price of the good" do
    @vendor.stock(@good, 10, 5, 6)
    expect(@vendor.buy_price(@good)).to eq(5)
  end
  
  it "#sell_price returns the sell price of the good" do
    @vendor.stock(@good, 10, 5, 6)
    expect(@vendor.sell_price(@good)).to eq(6)
  end
  
  it "#stock should stock the good" do
    expect{@vendor.stock(@good, 100, 20, 30)}.to change{@vendor.quantity_of(@good)}.by(100)
  end
  
  it "#restock should increase the quantity of an existing good" do
    new_good = Fabricate(:good)
    @vendor.stock(new_good, 10, 5, 7)
    expect{@vendor.restock(new_good, 20)}.to change{@vendor.quantity_of(new_good)}.by(20)
  end
  
  it "#trades_in? should return true if shop trades in that item" do
    @vendor.stock(@good, 0, 1, 3)
    expect(@vendor.trades_in?(@good)).to be_true
  end
  
  it "#trades_in? should return false if shop does not trade in that item" do
    not_in_stock = Fabricate(:good)
    expect(@vendor.trades_in?(not_in_stock)).to be_false
  end
  
end
