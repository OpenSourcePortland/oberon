namespace :maintenance do

  desc "set nil quantities to 0"
  task :fix_nil_quantities do
    CharacterInventoryItem.where(quantity: nil).update_all(quantity: 0)
    ShopInventoryItem.where(quantity: nil).update_all(quantity: 0)
  end

end