namespace :db do
   task populate: :environment do
      image_location = "/var/www/162.243.59.103/public_html/Gallery"

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
      rooling.created_by = "mmole"
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
      hooty.created_by = "mmole"
      hooty.created_on = Time.now
      hooty.toggle!(:reviewed)
      hooty.toggle!(:starter)
      hooty.save

      #Builds the pet species Stalk
      stalk = Pet.create!(species_name: "Stalk",
                          description: "A cat that roams the great jungle. It's eyes are as ferocious as its sharp teeth. Watch out for this one",
                          image: File.open(File.join(image_location, 'tiger.jpg')),
                          hp: 10,
                          atk: 10,
                          def: 5,
                          spd: 5,
                          monster: false)
      stalk.level = 1
      stalk.cost = 50
      stalk.created_by = "mmole"
      stalk.created_on = Time.now
      stalk.toggle!(:reviewed)
      stalk.toggle!(:starter)
      stalk.save

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
      mousling.created_by = "mmole"
      mousling.created_on = Time.now
      mousling.toggle!(:reviewed)
      mousling.save
   end
end
