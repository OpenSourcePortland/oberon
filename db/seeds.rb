# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ship.create!(
  :name => 'falcon', 
)

Ship.create!(
  :name => 'firefly', 
)

Ship.create!(
  :name => 'obergone', 
)
            
Location.create!(
  :name => "Earth",
  :category => :blue_planet,
)

Location.create!(
  :name => "Earth's Moon",
  :category => :moon,
)

Location.create!(
  :name => "Mars",
  :category => :red_planet,
)            

Property.create!(
  :name => "Olympus Fields",
  :property_type => :mining,
  :resource_count => 3000,
  :output_rate => 1,
  :renewable => false,
  :location_id => 3,
  :price => 4000
)

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