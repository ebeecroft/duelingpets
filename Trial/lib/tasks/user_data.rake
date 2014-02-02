namespace :db do
   task populate: :environment do
      admin = User.create!(first_name: "Monty",
                           last_name: "Mole",
                           email: "mmole@funhill.com",
                           vname: "mmole",
                           password: "Mole12",
                           password_confirmation: "Mole12")
      admin.toggle!(:admin)
      admin.joined_on = Date.today
      admin.save

      #Builds petcreator who is in charge of the pets
      petcreator = User.create!(first_name: "Pet",
                           last_name: "Creator",
                           email: "petcreator@duelingpets.net",
                           vname: "petcreator",
                           password: "petcreator",
                           password_confirmation: "petcreator")
      petcreator.joined_on = Date.today
      petcreator.save
   end
end
