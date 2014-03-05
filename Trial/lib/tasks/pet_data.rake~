namespace :db do
   task populate: :environment do
      image_location = "/var/www/duelingpets.net/public_html/Gallery/pets"

      #Builds the pet species Rooling
      rooling = Pet.create!(species_name: "Rooling",
                          description: "A happy roo that bounces around in the forest as it hops on its large feet",
                          image: File.open(File.join(image_location, 'Kangaroo_pictureEdit.png')),
                          hp: 10,
                          atk: 5,
                          def: 5,
                          spd: 10,
                          monster: false)
      rooling.level = 1
      rooling.cost = 50
      rooling.created_by = "petcreator"
      rooling.created_on = Time.now
      rooling.toggle!(:reviewed)
      rooling.toggle!(:starter)
      rooling.save

      #Builds the pet species Hooty
      hooty = Pet.create!(species_name: "Hooty",
                          description: "A creature that hoots at the moon during a dark night",
                          image: File.open(File.join(image_location, 'owl.jpg')),
                          hp: 10,
                          atk: 5,
                          def: 10,
                          spd: 5,
                          monster: false)
      hooty.level = 1
      hooty.cost = 50
      hooty.created_by = "petcreator"
      hooty.created_on = Time.now
      hooty.toggle!(:reviewed)
      hooty.toggle!(:starter)
      hooty.save

      #Builds the pet species Bandit
      bandit = Pet.create!(species_name: "Bandit",
                          description: "A creature who no one knows what lies below the mask",
                          image: File.open(File.join(image_location, 'Raccoon.jpg')),
                          hp: 10,
                          atk: 10,
                          def: 5,
                          spd: 5,
                          monster: false)
      bandit.level = 1
      bandit.cost = 50
      bandit.created_by = "petcreator"
      bandit.created_on = Time.now
      bandit.toggle!(:reviewed)
      bandit.toggle!(:starter)
      bandit.save

      #Builds the pet species Klaus
      klaus = Pet.create!(species_name: "Klaus",
                          description: "Klaus is known to be one of Santa's helpers. Klaus knows who has been bad or good.",
                          image: File.open(File.join(image_location, 'teddy.jpg')),
                          hp: 12,
                          atk: 6,
                          def: 8,
                          spd: 5,
                          monster: false)
      klaus.level = 2
      klaus.cost = 50
      klaus.created_by = "petcreator"
      klaus.created_on = Time.now
      klaus.toggle!(:reviewed)
      klaus.save

      #Builds the pet species Slither
      slither = Pet.create!(species_name: "Slither",
                          description: "Slither is a creature who inhabits the jungle to seek out evil.",
                          image: File.open(File.join(image_location, 'greensnake.jpg')),
                          hp: 15,
                          atk: 13,
                          def: 8,
                          spd: 10,
                          monster: false)
      slither.level = 9
      slither.cost = 70
      slither.created_by = "petcreator"
      slither.created_on = Time.now
      slither.toggle!(:reviewed)
      slither.save

      #Builds the monster Mousling
      mousling = Pet.create!(species_name: "Mousling",
                          description: "An evil mouse from the chedder forces.",
                          image: File.open(File.join(image_location, 'mousecakeredone.png')),
                          hp: 10,
                          atk: 5,
                          def: 5,
                          spd: 5,
                          monster: true)
      mousling.level = 1
      mousling.cost = 50
      mousling.created_by = "petcreator"
      mousling.created_on = Time.now
      mousling.toggle!(:reviewed)
      mousling.save

      #Builds the monster Red Fang
      redfang = Pet.create!(species_name: "Red Fang",
                          description: "A scary monster that inhabits the jungle watch out for its fangs.",
                          image: File.open(File.join(image_location, 'rotesnake.jpg')),
                          hp: 13,
                          atk: 8,
                          def: 10,
                          spd: 5,
                          monster: true)
      redfang.level = 4
      redfang.cost = 60
      redfang.created_by = "petcreator"
      redfang.created_on = Time.now
      redfang.toggle!(:reviewed)
      redfang.save

      #Builds the pet species Stalk
      stalk = Pet.create!(species_name: "Stalk",
                          description: "A cat that roams the great jungle. It's eyes are as ferocious as its sharp teeth. Watch out for this one",
                          image: File.open(File.join(image_location, 'tiger.jpg')),
                          hp: 14,
                          atk: 12,
                          def: 8,
                          spd: 7,
                          monster: true)
      stalk.level = 6
      stalk.cost = 60
      stalk.created_by = "petcreator"
      stalk.created_on = Time.now
      stalk.toggle!(:reviewed)
      stalk.save

      #Builds the monster Bloodling
      bloodling = Pet.create!(species_name: "Bloodling",
                          description: "Bloodlings are known for their canibalistic roots, taking creatures in their claws and drinking their blood. No one has ever escaped a bloodling.",
                          image: File.open(File.join(image_location, 'Vampire-batEdit.png')),
                          hp: 20,
                          atk: 8,
                          def: 14,
                          spd: 12,
                          monster: true)
      bloodling.level = 11
      bloodling.cost = 80
      bloodling.created_by = "petcreator"
      bloodling.created_on = Time.now
      bloodling.toggle!(:reviewed)
      bloodling.save
   end
end
