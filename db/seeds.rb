# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ship.create!(
  :name => 'falcon', 
  :fuel => 1
)

Ship.create!(
  :name => 'firefly', 
  :fuel => 1
)

Ship.create!(
  :name => 'obergone', 
  :fuel => 1
)
            
Location.create!(
  :name => "Earth",
  :category => :blue_planet,

  :x => 1,
  :y => 1,
  :z => 1
)

Location.create!(
  :name => "Earth's Moon",
  :category => :moon,
  :x => 50,
  :y => 50,
  :z => 50
)

Location.create!(
  :name => "Mars",
  :category => :red_planet,
  :x => 800,
  :y => 300,
  :z => 1400
)            

Property.create!(
  :name => "Olympus Fields",
  :location_id => 3,
  :price => 4000
)

shop = Shop.create!(
  :name => "Space Emporium",
  :location_id => 1
)

Shop.create!(
  :name => "Galactic Space Mattress Super Store",
  :location_id => 2
)

Good.create!(
  :name => "food"
)

Good.create!(
  :name => "fuel"
)

Good.create!(
  :name => "gold"
)

# shop.ware.create!(
#   :good_id => 1,
#   :shop_id => 1,
#   :buy_price => 50,
#   :sell_price => 75,
#   :quantity => 100
# )
# 
# Ware.create!(
#   :good_id => 2,
#   :shop_id => 1,
#   :buy_price => 25,
#   :sell_price => 50,
#   :quantity => 100
#   
# )
# 
# Ware.create!(
#   :good_id => 3,
#   :shop_id => 2,
#   :buy_price => 75,
#   :sell_price => 150,
#   :quantity => 0
# )
# 
# Ware.create!(
#   :good_id => 3,
#   :character_id => 1,
#   :buy_price => 75,
#   :sell_price => 150,
#   :quantity => 0
# )
# 
# Ware.create!(
#   :good_id => 3,
#   :character_id => 2,
#   :buy_price => 75,
#   :sell_price => 150,
#   :quantity => 0
# )



# Possession.create!(
#   :good_id => 1,
#   :character_id => 1,
#   :quantity => 20
# )
# 
# Possession.create!(
#   :good_id => 2,
#   :character_id => 2,
#   :quantity => 10
# )
# 
# Possession.create!(
#   :good_id => 2,
#   :shop_id => 2,
#   :quantity => 10
# )
# 
# Possession.create!(
#   :good_id => 2,
#   :shop_id => 2,
#   :quantity => 10
# )

Property.create!(
  :name => "Gold Mountain",
  :location_id => 3,
  :price => 5000
)

Property.create!(
  :name => "Iron Ore lake",
  :location_id => 3,
  :price => 4000
)

# Material.create!(
#   :property_id => 1,
#   :good_id => 1,
#   :output_rate => 3,
#   :quantity => 5000,
#   :renewable => false
# )
# 
# Material.create!(
#   :property_id => 1,
#   :good_id => 3,
#   :output_rate => 3,
#   :quantity => 5000,
#   :renewable => false
# )
# 
# Material.create!(
#   :property_id => 1,
#   :good_id => 2,
#   :output_rate => 3,
#   :quantity => 0,
#   :renewable => true
# )

NUMBER_OF_PROPERTY_MATERIALS = 100
NUMBER_OF_PROPERTY_MATERIALS.times do |i|
  Material.create!(
    :property_id => 1,
    :good_id => i,
    :output_rate => 3,
    :quantity => 0,
    :renewable => true
  )
end

NUMBER_OF_MATERIALS = 500
NUMBER_OF_MATERIALS.times do |i|
  Material.create!(
    :property_id => rand(500),
    :good_id => 100 + i,
    :output_rate => 3,
    :quantity => 0,
    :renewable => true
  )
end


NUMBER_OF_USERS = 100
NUMBER_OF_USERS.times do |i|
  puts "Working user #{i}" if i % 100 == 0
  c = Character.create(name: "Test User #{i}", species: "Human", location_id: 1)
  c.create_profile(compassion: rand(101), 
                      courage: rand(101), 
                dependability: rand(101), 
                    endurance: rand(101), 
                      honesty: rand(101), 
                        honor: rand(101), 
                     charisma: rand(101), 
                   leadership: rand(101), 
                    logistics: rand(101), 
                   perception: rand(101), 
                        pilot: rand(101), 
                    quickness: rand(101), 
                     tactical: rand(101), 
                          wit: rand(101))
end

Character.first.add_good(Good.create!, 10)

Shop.first.add_good(Good.create!, 10)