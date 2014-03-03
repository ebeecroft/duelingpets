namespace :db do
   task populate: :environment do

      #Builds the admin who manages the site
      admin = User.create!(first_name: "Monty",
                           last_name: "Mole",
                           email: "mmole@funhill.com",
                           vname: "mmole",
                           password: "Mole12",
                           password_confirmation: "Mole12")
      admin.toggle!(:admin)
      admin.joined_on = Time.now
      admin.save

      #Builds petcreator who is in charge of the pets
      petcreator = User.create!(first_name: "Pet",
                           last_name: "Creator",
                           email: "petcreator@duelingpets.net",
                           vname: "petcreator",
                           password: "petcreator",
                           password_confirmation: "petcreator")
      petcreator.joined_on = Time.now
      petcreator.save

      #Builds forumowner who is in charge of the forum
      forumowner = User.create!(first_name: "Forum",
                           last_name: "Owner",
                           email: "forumowner@duelingpets.net",
                           vname: "forumowner",
                           password: "forumowner",
                           password_confirmation: "forumowner")
      forumowner.joined_on = Time.now
      forumowner.save
   end
end
