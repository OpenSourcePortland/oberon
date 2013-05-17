require 'spec_helper'

describe Quartermaster do
  before(:each) do
    @q = Quartermaster.new
    @character = Fabricate(:character)
    @shop = Fabricate(:shop)
    @good = Fabricate(:good)
    @not_enough_of_good = Fabricate(:good)
    @shop.stock(@good, 10, 50, 100)
  end
  
  #Quartermaster.transact(Character.first, Shop.first, Good.first, 20)
  
  it "#transact should increase quantity of buyer's good by 20" do
    expect{Quartermaster.transact(@character, @shop, @good, 20)}.to change{@character.quantity_of(@good)}.by(20)
  end
  
  it "#transact should decrease quantity of shop's good by 20" do
    expect{Quartermaster.transact(@character, @shop, @good, 20)}.to change{@shop.quantity_of(@good)}.by(-20)
  end
  
  it "#transact should not increase buyer's good quantity if not enough goods to transact" do
    @shop.stock(@not_enough_of_good, 10, 50, 10)
    expect{Quartermaster.transact(@character, @shop, @not_enough_of_good, 200)}.to change{@character.quantity_of(@not_enough_of_good)}.by(0)
  end
  
  it "#transact should not decrease seller's good quantity if not enough goods to transact" do
    @shop.stock(@not_enough_of_good, 10, 50, 10)
    expect{Quartermaster.transact(@character, @shop, @not_enough_of_good, 200)}.to change{@shop.quantity_of(@not_enough_of_good)}.by(0)
  end
  
end
  
# describe "when selling to character" do
#    it "#sell_price_of should return the correct sell_price for that item" do
#      expect(@shop.sell_price_of(@good)).to eq(50)
#    end
#    
#    it "#sell should reduce quantity of item by quantity" do
#      expect{@shop.sell(character, @good, 10)}.to change{@shop.quantity_of(@good)}.by(-10)  
#    end
#    
#    it "#sell should increase character's quantity of item by quantity" do
#      expect{@shop.sell(character, @good, 10)}.to change{character.quantity_of(@good)}.by(10)  
#    end
#    
#    it "#sell should return false if not enough goods in stock" do
#      expect(@shop.sell(character, @good, 1000)).to be_false
#    end
#  end
#  
#  describe "when buying from character" do
#    it "#buy_price_of should return the correct buy_price for that item" do
#      expect(@shop.buy_price_of(@good)).to eq(10)
#    end
#    
#    it "#buy should increase quantity of item by quantity" do
#      character.stock(@good, 50)
#      expect{@shop.buy(character, @good, 10)}.to change{@shop.quantity_of(@good)}.by(10)  
#    end    
#    
#    it "#buy should not increase quantity of item if character doesn't have enough" do
#      character.stock(@good, 5)
#      expect{@shop.buy(character, @good, 10)}.to change{@shop.quantity_of(@good)}.by(0)  
#    end
# 
#    it "#buy should reduce the character's quantity of item by quantity" do
#      character.stock(@good, 100)
#      expect{@shop.buy(character, @good, 10)}.to change{character.quantity_of(@good)}.by(-10)  
#    end
#    
#    it "#buy should return false if character doesn't have item" do
#      expect(@shop.buy(character, @good, 10)).to be_false 
#    end
#    
#    it "#buy should return false if character doesn't have enough of item" do
#      character.stock(@good, 5)
#      expect(@shop.buy(character, @good, 10)).to be_false 
#    end
#  end