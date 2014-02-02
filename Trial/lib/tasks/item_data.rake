namespace :db do
   task populate: :environment do
      image_location = "/var/www/162.243.59.103/public_html/Gallery/items"

      #Build the item Veggie Mascot 
      mascot = Item.create!(name: "Veggie Mascot",
                          description: "Your mom always told you to eat your veggies, so why aren't you?",
                          ipicture: File.open(File.join(ipicture_location, 'veggies.jpg')),
                          hp: 10,
                          atk: 0,
                          def: 0,
                          spd: 0,
                          cost: 36
                          manyuses: false)
      mascot.save

      #Build the item Pin of Doom 
      pinofdoom = Item.create!(name: "Pin of Doom",
                          description: "An ancient weapon that women used on their husbands.",
                          ipicture: File.open(File.join(ipicture_location, 'pinofdoom.jpg')),
                          hp: 0,
                          atk: 5,
                          def: 0,
                          spd: 2,
                          cost: 35
                          manyuses: true)
      pinofdoom.save

      #Build the item Small Shield 
      shield = Item.create!(name: "Small Shield",
                          description: "A handy piece of armor to protect your side.",
                          ipicture: File.open(File.join(ipicture_location, 'shield.jpg')),
                          hp: 0,
                          atk: 0,
                          def: 4,
                          spd: 0,
                          cost: 33
                          manyuses: true)
      shield.save

      #Build the item Wall Climber
      climber = Item.create!(name: "Wall Climber",
                          description: "A special tool that not only allows you to climb walls but is also useful in combat.",
                          ipicture: File.open(File.join(ipicture_location, 'wallclimber.jpg')),
                          hp: 0,
                          atk: 2,
                          def: 8,
                          spd: 3,
                          cost: 38
                          manyuses: true)
      climber.save

      #Build the item Small Boost 
      smallboost = Item.create!(name: "Small Boost",
                          description: "Who knew that snails could move so fast?",
                          ipicture: File.open(File.join(ipicture_location, 'smallboost.jpg')),
                          hp: 0,
                          atk: 0,
                          def: 0,
                          spd: 2,
                          cost: 32
                          manyuses: true)
      smallboost.save

      #Build the item Medium Boost 
      mediumboost = Item.create!(name: "Medium Boost",
                          description: "Against the hare the turtle is steady but fast.",
                          ipicture: File.open(File.join(ipicture_location, 'mediumboost.jpg')),
                          hp: 0,
                          atk: 0,
                          def: 0,
                          spd: 5,
                          cost: 34
                          manyuses: true)
      mediumboost.save

      #Build the item Slapper
      slapper = Item.create!(name: "Slapper",
                          description: "A light weapon for attacking evil monsters.",
                          ipicture: File.open(File.join(ipicture_location, 'slapper.jpg')),
                          hp: 0,
                          atk: 3,
                          def: 0,
                          spd: 1,
                          cost: 33
                          manyuses: true)
      slapper.save
   end
end
