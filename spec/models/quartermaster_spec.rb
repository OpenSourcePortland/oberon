require 'spec_helper'

describe Quartermaster do
  before(:each) do
    @q = Quartermaster.new
    @character = Fabricate(:character)
    @shop = Fabricate(:shop)
    @good = Fabricate(:good)
    @not_enough_of_good = Fabricate(:good)
    @shop.stock(@good, 10, 50, 100)
    @character.initialize_inventory_item(@good, 30)
    @character.initialize_inventory_item(@not_enough_of_good, 30)
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
  
