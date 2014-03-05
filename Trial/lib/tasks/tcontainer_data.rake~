namespace :db do
   task populate: :environment do
      #Builds Basic container
      basic = Tcontainer.create!(name: "Basic",
                           forum_id: 1)
      basic.user_id = 3
      basic.created_on = Time.now
      basic.save

      #Builds Intermediate container
      intermediate = Tcontainer.create!(name: "Intermediate",
                           forum_id: 1)
      intermediate.user_id = 3
      intermediate.created_on = Time.now
      intermediate.save

      #Builds Advanced container
      advanced = Tcontainer.create!(name: "Advanced",
                           forum_id: 1)
      advanced.user_id = 3
      advanced.created_on = Time.now
      advanced.save

      #Builds Stories container
      stories = Tcontainer.create!(name: "Stories",
                           forum_id: 1)
      stories.user_id = 3
      stories.created_on = Time.now
      stories.save
   end
end
