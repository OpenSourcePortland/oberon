# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Ship.create!(:name => 'falcon', 
             :ship_type => 'fighter', 
             :price => '500', 
             :size => '10'
             )
Ship.create!(:name => 'firefly', 
            :ship_type => 'miner', 
            :price => '100', 
            :size => '5'
            )
Ship.create!(:name => 'obergone', 
            :ship_type => 'farmer', 
            :price => '200', 
            :size => '2'
            )

NUMBER_OF_USERS = 10
NUMBER_OF_USERS.times do |i|
  c = Character.create(name: "Test User #{i}", species: "Human")
  c.create_profile(compassion_level: rand(101), 
                      courage_level: rand(101), 
                dependability_level: rand(101), 
                    endurance_level: rand(101), 
                      honesty_level: rand(101), 
                        honor_level: rand(101), 
                interpersonal_level: rand(101), 
                   leadership_level: rand(101), 
                    logistics_level: rand(101), 
                   perception_level: rand(101), 
                        pilot_level: rand(101), 
                       reflex_level: rand(101), 
                     tactical_level: rand(101), 
                          wit_level: rand(101))
end