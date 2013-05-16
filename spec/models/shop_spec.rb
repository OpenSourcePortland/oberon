require 'spec_helper'

describe Shop do
  before(:each) do
    @shop = Fabricate(:shop)
    @good = Fabricate(:good)
    @not_in_stock = Fabricate(:good)
    @out_of_stock = Fabricate(:good)
    @shop.stock(@good, 10, 50, 100)
    @shop.stock(@out_of_stock, 10, 50, 0)
    
  end
  
  let(:character) { Fabricate(:character) }
  
  describe "#stock" do
    it "should add an inventory item to the shop" do
      @random_good = Fabricate(:good)
      @shop.stock(@random_good, 10, 50, 100)
      expect(@shop.has_stock_of?(@random_good)).to be_true
    end
    
    it "should increase the quantity if the good is already in stock" do
      good = Fabricate(:good)
      @shop.stock(good, 10, 50, 50)
      @shop.stock(good, 10, 100, 50)
      expect(@shop.quantity_of(good)).to eq(100)
    end
  end
  
  it "#quantity_of should return the correct quantity of that item" do
    expect(@shop.quantity_of(@good)).to eq(100)
  end
  
  it "#trades_in? should return true if shop trades in that item" do
    expect(@shop.trades_in?(@good)).to be_true
  end
  
  it "#trades_in? should return false if shop does not trade in that item" do
    expect(@shop.trades_in?(@not_in_stock)).to be_false
  end
  
  it "#has_stock_of? should return true if item is in stock" do
    expect(@shop.has_stock_of?(@good)).to be_true
  end
  
  it "#has_stock_of? should return false if item is out of stock or shop does not trade in that item" do
    expect(@shop.has_stock_of?(@not_in_stock)).to be_false
  end
    
  describe "when selling to character" do
    it "#sell_price_of should return the correct sell_price for that item" do
      expect(@shop.sell_price_of(@good)).to eq(50)
    end
    
    it "#sell should reduce quantity of item by quantity" do
      expect{@shop.sell(character, @good, 10)}.to change{@shop.quantity_of(@good)}.by(-10)  
    end
    
    it "#sell should increase character's quantity of item by quantity" do
      expect{@shop.sell(character, @good, 10)}.to change{character.quantity_of(@good)}.by(10)  
    end
    
    it "#sell should return false if not enough goods in stock" do
      expect(@shop.sell(character, @good, 1000)).to be_false
    end
  end
  
  describe "when buying from character" do
    it "#buy_price_of should return the correct buy_price for that item" do
      expect(@shop.buy_price_of(@good)).to eq(10)
    end
    
    it "#buy should increase quantity of item by quantity" do
      character.stock(@good, 50)
      expect{@shop.buy(character, @good, 10)}.to change{@shop.quantity_of(@good)}.by(10)  
    end    
    
    it "#buy should not increase quantity of item if character doesn't have enough" do
      character.stock(@good, 5)
      expect{@shop.buy(character, @good, 10)}.to change{@shop.quantity_of(@good)}.by(0)  
    end

    it "#buy should reduce the character's quantity of item by quantity" do
      character.stock(@good, 100)
      expect{@shop.buy(character, @good, 10)}.to change{character.quantity_of(@good)}.by(-10)  
    end
    
    it "#buy should return false if character doesn't have item" do
      expect(@shop.buy(character, @good, 10)).to be_false 
    end
    
    it "#buy should return false if character doesn't have enough of item" do
      character.stock(@good, 5)
      expect(@shop.buy(character, @good, 10)).to be_false 
    end
  end


    
end
