require 'spec_helper'

shared_examples "transactionable" do
  
  before(:each) do
    @good = Fabricate(:good)
    @owner.add_good(@good, 100)
  end
  
  it "#has_any? should return true" do
     expect(@owner.has_any?(@good)).to be_true
  end
  
  it "#quantity_of should return the correct quantity of that item" do
    expect(@owner.quantity_of(@good)).to eq(100)
  end
  
  describe "#has_enough?" do
    it "should return true if they have >= quantity" do
      expect(@owner.has_enough?(@good, 50)).to be_true
    end
  
    it "should return false if they have < quantity" do
      expect(@owner.has_enough?(@good, 500)).to be_false
    end
  end
  
  describe "#reduce_good" do  
    it "#reduce_good should remove the full quantity of the good from their possessions if they have enough" do
      new_good = Fabricate(:good)
      @owner.add_good(new_good, 20)
      expect{@owner.reduce_good(new_good, 10)}.to change{@owner.quantity_of(new_good)}.by(-10)
    end
  
    it "#reduce_good should return false if they don't have enough" do
      new_good = Fabricate(:good)
      @owner.add_good(new_good, 5)
      expect(@owner.reduce_good(new_good, 10)).to be_false
    end
  end
  
  describe "#add_good" do   
    it "#add_good should add a quantity of the good to their possessions" do 
      new_good = Fabricate(:good)
      expect{@owner.add_good(new_good, 10)}.to change{@owner.quantity_of(new_good)}.by(10)
    end
  
    it "should add a quantity of the good to their possessions when called a second time" do
      new_good = Fabricate(:good)
      @owner.add_good(new_good, 10)
      @owner.add_good(new_good, 10)
      expect(@owner.quantity_of(new_good)).to eq(20)
    end
    
    it "should create possession for the good" do
      good = Fabricate(:good)
      @owner.add_good(good, 10)
      expect(@owner.quantity_of(good)).to eq(10)
    end
  end
end