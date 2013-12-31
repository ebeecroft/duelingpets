namespace :db do
   task populate: :environment do
      #Builds Basic container
      basics = Tcontainer.create!(name: "Basics",
                           forum_id: 1)
      basics.user_id = 1
      basics.save

      #Builds Misc container
      misc = Tcontainer.create!(name: "Misc",
                           forum_id: 1)
      misc.user_id = 1
      misc.save
   end
end
