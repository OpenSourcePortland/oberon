require 'spec_helper'
#require 'support/owning_spec.rb'

describe Shop do
  before(:each) do
    @owner = Fabricate(:shop)
    #@good = Fabricate(:good)
    #@not_in_stock = Fabricate(:good)
    #@out_of_stock = Fabricate(:good)
    #@owner.stock(@good, 10, 50, 100)
    #@owner.stock(@out_of_stock, 10, 50, 0)   
  end
  
  let(:character) { Fabricate(:character) }
  let(:shop) { @owner }
  
  it_behaves_like "owning"
  
  describe "#stock" do
    it "should add an inventory item to the shop" do
      pending
      @random_good = Fabricate(:good)
      shop.stock(@random_good, 10, 50, 100)
      expect(shop.has_stock_of?(@random_good)).to be_true
    end
  end

  it "#restock should increase the quantity if the good is already in stock" do
    pending
    good = Fabricate(:good)
    shop.stock(good, 10, 50, 50)
    shop.restock(good, 50)
    expect(shop.quantity_of(good)).to eq(100)
  end
  
  it "#trades_in? should return true if shop trades in that item" do
    pending
    expect(shop.trades_in?(@good)).to be_true
  end
  
  it "#trades_in? should return false if shop does not trade in that item" do
    pending
    expect(shop.trades_in?(@not_in_stock)).to be_false
  end
  
  describe "these will be shared examples" do
    it "#has_stock_of? should return true if item is in stock" do
      pending
       expect(shop.has_stock_of?(@good)).to be_true
     end  
  end
 
  it "#has_stock_of? should return false if item is out of stock or shop does not trade in that item" do
    pending
    expect(shop.has_stock_of?(@not_in_stock)).to be_false
  end
    
  describe "when selling to character" do
    it "#sell_price_of should return the correct sell_price for that item" do
      pending
      expect(shop.sell_price_of(@good)).to eq(50)
    end
  end
  
  describe "when buying from character" do
    it "#buy_price_of should return the correct buy_price for that item" do
      pending
      expect(shop.buy_price_of(@good)).to eq(10)
    end
  end    
end
