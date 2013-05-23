require 'spec_helper'

describe Quartermaster do
  before(:each) do
    @q = Quartermaster.new
    @character = Fabricate(:character)
    @shop = Fabricate(:shop)
    @good = Fabricate(:good)
    @not_enough_of_good = Fabricate(:good)
  end
  
  #Quartermaster.transact(buyer, seller, good, quantity)
  
  describe "for successful transactions" do
    
    describe "between a character buying and a shop selling" do
  
      it "#transact should increase quantity of character buyer's possession of good by 20" do
        @shop.stock(@good, 30, 50, 100)
        expect{Quartermaster.transact(@character, @shop, @good, 20)}.to change{@character.quantity_of(@good)}.by(20)
      end
  
      it "#transact should decrease quantity of shop seller's ware of good by 20" do
        @shop.stock(@good, 30, 50, 100)
        expect{Quartermaster.transact(@character, @shop, @good, 20)}.to change{@shop.quantity_of(@good)}.by(-20)
      end
    end
  
    describe "between a shop buying and a character selling" do
    
      it "#transact should increase quantity of shop buyer's ware of good by 20 if shop trades_in item" do
        @shop.stock(@good, 0, 0, 0)
        @character.add_good(@good, 30)
        expect{Quartermaster.transact(@shop, @character, @good, 20)}.to change{@shop.quantity_of(@good)}.by(20)
      end
  
      it "#transact should decrease quantity of character's possession of good by 20 if shop trades_in item" do
        @shop.stock(@good, 0, 0, 0)
        @character.add_good(@good, 30)
        expect{Quartermaster.transact(@shop, @character, @good, 20)}.to change{@character.quantity_of(@good)}.by(-20)
      end
    end
  
    describe "between a character buying and a character selling" do
      
      it "#transact should increase quantity of character's possession of good by 20 " do
        @selling_character = Fabricate(:character)
        @selling_character.add_good(@good, 30)
        expect{Quartermaster.transact(@character, @selling_character, @good, 20)}.to change{@character.quantity_of(@good)}.by(20)
      end
    
      it "#transact should decrease quantity of character's possession of good by 20 " do
        @selling_character = Fabricate(:character)
        @selling_character.add_good(@good, 30)
        expect{Quartermaster.transact(@character, @selling_character, @good, 20)}.to change{@selling_character.quantity_of(@good)}.by(-20)
      end
    end
  end
  
  describe "for unsuccessful transactions" do 
    
    describe "between a character buying and a shop selling" do
  
      it "#transact should not increase character buyer's possession of good if not enough goods to transact" do
        @shop.stock(@not_enough_of_good, 10, 50, 10)
        expect{Quartermaster.transact(@character, @shop, @not_enough_of_good, 200)}.to change{@character.quantity_of(@not_enough_of_good)}.by(0)
      end
  
      it "#transact should not decrease shop seller's ware of good quantity if not enough goods to transact" do
        @shop.stock(@not_enough_of_good, 10, 50, 10)
        expect{Quartermaster.transact(@character, @shop, @not_enough_of_good, 200)}.to change{@shop.quantity_of(@not_enough_of_good)}.by(0)
      end
      
      it "#transact should return false if the character is the buyer and the shop doesn't have that good" do
        not_in_stock = Fabricate(:good)
        expect(Quartermaster.transact(@character, @shop, not_in_stock, 200)).to be_false
      end
    end
  
    describe "between a shop buying and a character selling" do
    
      it "#transact should not increase shop buyer's ware of good if not enough goods to transact or buyer possession does not exist" do
        @shop.stock(@not_enough_of_good, 0, 0, 0)
        expect{Quartermaster.transact(@shop, @character, @not_enough_of_good, 200)}.to change{@character.quantity_of(@not_enough_of_good)}.by(0)
      end
    
      it "#transact should not decrease character seller's possession of good quantity if not enough goods to transact or buyer possession does not exist" do
        @shop.stock(@not_enough_of_good, 0, 0, 0)
        expect{Quartermaster.transact( @shop, @character, @not_enough_of_good, 200)}.to change{@shop.quantity_of(@not_enough_of_good)}.by(0)
      end  
      
      it "#transact should return false if the shop is the buyer and does not trade in that good" do
        not_in_stock = Fabricate(:good)
        @character.add_good(not_in_stock, 300)
        expect(Quartermaster.transact(@shop, @character, not_in_stock, 200)).to be_false
      end
    end
    
    describe "between a character buying and a character selling" do

      it "#transact should not increase quantity of buying character's possession of good if not enough or possession doesn't exist" do
         @selling_character = Fabricate(:character)
         expect{Quartermaster.transact(@character, @selling_character, @good, 20)}.to change{@character.quantity_of(@good)}.by(0)
       end

       it "#transact should not decrease quantity of selling character's possession of good if not enough " do
         @selling_character = Fabricate(:character)
         @selling_character.add_good(@good, 1)
         expect{Quartermaster.transact(@character, @selling_character, @good, 20)}.to change{@selling_character.quantity_of(@good)}.by(0)
       end  
       
       it "#transact should return false if not enough or good doesn't exist " do
         @selling_character = Fabricate(:character)        
         expect(Quartermaster.transact(@character, @selling_character, @good, 20)).to be_false
       end    
    end
    
    describe "for weird/ bad data transactions" do
      it "#transact should return false and not change quantities if negative numbers used" do
        @shop.stock(@good, 10, 0, 0)
        expect{Quartermaster.transact(@character, @shop, @good, -5)}.to change{@character.quantity_of(@good)}.by(0)
        expect(Quartermaster.transact(@character, @shop, @good, -5)).to be_true
        
      end
    end    
  end
end
  
