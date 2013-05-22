class Quartermaster
  
  
 #  def character.buy_good(character, good_receiving, quantity_receiving, quanity_giving)
 #     trade(giver, getter, giving, quantity_giving, getting, getting_quantity)    
 #   end
 #   
 #   
 #   
 #   
 # 50 gold
 #   
 #   def buy_good(character, good_receiving, quantity_receiving, quanity_giving) #from store
 #     trade(giver, getter, gold, quantity_giving, getting, getting_quantity)    
 #   end
 #       
 #   def sell_good() #to store
 #     trade(giver, getter, giving, quantity_giving, gold, getting_quantity)    
 #   end
 #   
 #   def transact(giver, getter, giving, quantity_giving, getting, getting_quantity)
 #     #transact
 #   end
 #     
 #   def offer_trade(offering, offering_quantity, getting, getting_quantity)
 #    
 #   end
 #   
 #   # store buys from character joe (buy_price)
 #   # character joe sells_to_store #store dictates (buy_price)
 #     joe.reduce_good(good, 10)
 #     store.add_good(good, 10)
 #     joe.add_good(gold, store.buy_price_of(good))
 #     store.reduce_good(gold, store.buy_price_of(good))
 #   
 #   # character buys from store #store dictates (sell_price)
 #     joe.add_good(good, 10)
 #     store.reduce_good(good, 10)
 #     store.add_good(gold, store.sell_price_of(good))
 #     joe.reduce_good(gold, store.sell_price_of(good))
 #     
 #   # mary buys from joe   
 #   # character joe sells_to_character mary # selling character joe dictates (sell_price)
 #     joe.reduce_good(good, 10)
 #     mary.add_good(good, 10)
 #     joe.add_good(gold, joe.sell_price_of(good))
 #     mary.reduce_good(gold, joe.sell_price_of(good))
 #   
 #   # character joe buys from character mary # selling character mary dictates (sell_price)
 #     joe.add_good(good, 10)
 #     mary.reduce_good(good, 10)
 #     joe.reduce_good(gold, mary.sell_price_of(good))
 #     mary.increase_good(gold, mary.sell_price_of(good))
 #   
  
  
  
  
  #Quartermaster.transact(Character.first, Shop.first, Good.first, 20)
  
  def self.transact(buyer, seller, good, quantity)
    self.new.transact(buyer, seller, good, quantity)
  end
  
  def transact(buyer, seller, good, quantity)
    @buyer = buyer
    @seller = seller
    @good = good
    @quantity = quantity
    perform_transaction
  end
  
  def perform_transaction
    if transaction_valid?
      @buyer.add_good(@good, @quantity)
      @seller.reduce_good(@good, @quantity)
      true
    else
      false
    end
  end
  
  def transaction_valid?
    validate_stock && validate_can_afford
  end
  
  def validate_stock
    @seller.has_enough?(@good, @quantity)
  end
  
  def validate_can_afford
    true
    # Pending implementation of currency
  end
  
  
  #####
  # def self.transact(buyer, seller, good, quantity)
  #   self.new.transact(buyer, seller, good, quantity)
  # end
  # 
  # def transact(buyer, seller, good, quantity)
  #   @buyer = buyer
  #   @seller = seller
  #   @good = good
  #   @quantity = quantity
  #   perform_transaction
  # end
  # 
  # def perform_transaction
  #   if transaction_valid?
  #     @buyer.add_good(@good, @quantity)
  #     @seller.reduce_good(@good, @quantity)
  #     true
  #   else
  #     false
  #   end
  # end
  # 
  # def transaction_valid?
  #   validate_stock && validate_can_afford
  # end
  # 
  # def validate_stock
  #   @seller.has_enough?(@good, @quantity)
  # end
  # 
  # def validate_can_afford
  #   true
  #   # Pending implementation of currency
  # end
  
  
end