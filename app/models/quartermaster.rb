class Quartermaster
  
  
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
  
  
end