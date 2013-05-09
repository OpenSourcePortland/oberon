require 'spec_helper'

describe Shop do
  before(:each) do
    @shop = Fabricate(:shop)
    @good = Fabricate(:good)
    @shop.stock(@good, 10, 50, 100)
  end
  
  it "#stock should add an inventory item to the shop" do
    expect(@shop.goods.first).to eq(@good)
  end
  
  it "#buy_price_of should return the correct buy_price for that item" do
    expect(@shop.buy_price_of(@good)).to eq(10)
  end
  
end
