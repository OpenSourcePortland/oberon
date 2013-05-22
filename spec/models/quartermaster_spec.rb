require 'spec_helper'

describe Quartermaster do
  before(:each) do
    @q = Quartermaster.new
    @character = Fabricate(:character)
    @shop = Fabricate(:shop)
    @good = Fabricate(:good)
    @not_enough_of_good = Fabricate(:good)
    @shop.stock(@good, 30, 50, 100)
    #@character.initialize_inventory_item(@good, 30)
    #@character.initialize_inventory_item(@not_enough_of_good, 30)
  end
  
  #Quartermaster.transact(buyer, seller, good, quantity)
  
  it "#transact should increase quantity of buyer's possession of good by 20" do
    expect{Quartermaster.transact(@character, @shop, @good, 20)}.to change{@character.quantity_of(@good)}.by(20)
  end
  
  it "#transact should decrease quantity of shop's ware of good by 20" do
    expect{Quartermaster.transact(@character, @shop, @good, 20)}.to change{@shop.quantity_of(@good)}.by(-20)
  end
  
  it "#transact should not increase buyer's possession of good if not enough goods to transact" do
    @shop.stock(@not_enough_of_good, 10, 50, 10)
    expect{Quartermaster.transact(@character, @shop, @not_enough_of_good, 200)}.to change{@character.quantity_of(@not_enough_of_good)}.by(0)
  end
  
  it "#transact should not decrease seller's ware of good quantity if not enough goods to transact" do
    @shop.stock(@not_enough_of_good, 10, 50, 10)
    expect{Quartermaster.transact(@character, @shop, @not_enough_of_good, 200)}.to change{@shop.quantity_of(@not_enough_of_good)}.by(0)
  end
  
  it "#transact should return false if the shop is the buyer and does not trade in that good" do
    not_in_stock = Fabricate(:good)
    @character.add_good(not_in_stock, 300)
    expect(Quartermaster.transact(@shop, @character, not_in_stock, 200)).to be_false
  end
  
  it "#transact should return false if the character is the buyer and the shop doesn't have that good" do
    not_in_stock = Fabricate(:good)
    expect(Quartermaster.transact(@character, @shop, not_in_stock, 200)).to be_false
  end
  
  it "#transact should return true if the character is the buyer even if they don't have that good already" do
    not_in_stock = Fabricate(:good)
    @shop.stock(not_in_stock, 300, 10, 20)
    expect(Quartermaster.transact(@character, @shop, not_in_stock, 200)).to be_true
  end
  
  it "#transact should not change quantities of either party if it returns false" do
    not_in_stock = Fabricate(:good)
    expect{Quartermaster.transact(@character, @shop, not_in_stock, 200)}.to change{@shop.quantity_of(not_in_stock)}.by(0)
    expect{Quartermaster.transact(@character, @shop, not_in_stock, 200)}.to change{@character.quantity_of(not_in_stock)}.by(0)
    expect{Quartermaster.transact(@shop, @character, not_in_stock, 200)}.to change{@shop.quantity_of(not_in_stock)}.by(0)
    expect{Quartermaster.transact(@shop, @character, not_in_stock, 200)}.to change{@character.quantity_of(not_in_stock)}.by(0)
  end
  
end
  
