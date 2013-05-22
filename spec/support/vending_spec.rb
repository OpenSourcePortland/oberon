require 'spec_helper'

shared_examples "vending" do
  before(:each) do
    @good = Fabricate(:good)
  end
  
  # it "#buy_price returns the buy_price of the good" do
  #   @vendor.stock(@good, 10, 5, 6)
  #   expect(@vendor.buy_price(@good)).to eq(5)
  # end
  # 
  # it "#sell_price returns the sell price of the good" do
  #   @vendor.stock(@good, 10, 5, 6)
  #   expect(@vendor.sell_price(@good)).to eq(6)
  # end
  # 
  # it "#stock should stock the good" do
  #   expect{@vendor.stock(@good, 100, 20, 30)}.to change{@vendor.quantity_of_ware(@good)}.by(100)
  # end
  # 
  # it "#restock should increase the quantity of an existing good" do
  #   new_good = Fabricate(:good)
  #   @vendor.stock(new_good, 10, 5, 7)
  #   expect{@vendor.restock(new_good, 20)}.to change{@vendor.quantity_of_ware(new_good)}.by(20)
  # end
  # 
  # it "#trades_in? should return true if shop trades in that item" do
  #   @vendor.stock(@good, 0, 1, 3)
  #   expect(@vendor.trades_in?(@good)).to be_true
  # end
  # 
  # it "#trades_in? should return false if shop does not trade in that item" do
  #   not_in_stock = Fabricate(:good)
  #   expect(@vendor.trades_in?(not_in_stock)).to be_false
  # end
  
  # it "#ware_has_any? should return true if the vendor has that good" do
  #   new_good = Fabricate(:good)
  #   @vendor.stock(new_good, 1, 1, 1)
  #   expect(@vendor.has_any_ware?(new_good)).to be_true
  #   expect(@vendor.quantity_of_ware(new_good)).to eq(1)
  # end
  # 
  # it "#ware_quantity_of returns the quantity of that good" do
  #   new_good = Fabricate(:good)
  #   @vendor.stock(new_good, 1, 1, 1)
  #   expect(@vendor.quantity_of_ware(new_good)).to eq(1)
  # end 
  

  # 
  # it "#buy_good should increase the quantity of that good" do
  #   @vendor.stock(@good, 0, 1, 3)
  #   expect{@vendor.buy_good(@good, 10)}.to change{@vendor.quantity_of_ware(@good)}.by(10)
  # end
  # 
  # it "#sell_good should decrease the quantity of that good" do
  #   @vendor.stock(@good, 10, 1, 3)
  #   expect{@vendor.sell_good(@good, 10)}.to change{@vendor.quantity_of_ware(@good)}.by(-10)
  # end
  # 
  # it "#sell_good should return false if not enough of ware in stock" do
  #   not_enough = Fabricate(:good)
  #   @vendor.stock(not_enough, 0, 1, 3)
  #   expect(@vendor.sell_good(not_enough, 10)).to be_false
  # end
  
end