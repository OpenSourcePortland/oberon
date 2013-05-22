module Transactionable
  
  def add_good(good, quantity)
    item = find_or_create_item(good)

    manipulate_quantity(item, quantity)
  end
  
  def reduce_good(good, quantity)
    item = find_item(good)
    if has_enough?(good, quantity)
      manipulate_quantity(item, -quantity)
    else
      false
    end
  end
  
  def has_any?(good)
    has_enough?(good, 1)
  end
  
  def has_enough?(good, quantity)
    item = find_item(good)
    item && item.quantity >= quantity
  end
  
  def quantity_of(good)
    item = find_item(good)
    item ? item.quantity : 0
  end
  
  private
  
  def inventory_item(good)
    inventory_items.find_by_good_id(good.id)
  end

  def inventory_items
    raise "Abstract method inventory_items called"
  end
  
  def manipulate_quantity(item, quantity)
    item.update_attributes(quantity: item.quantity + quantity)
    #item.check_for_destroy
  end

  def find_item(good)
    inventory_items.find_by_good_id(good.id)
  end
  
  def find_or_create_item(good)
    inventory_items.find_or_create_by_good_id(good.id)
  end
  
end