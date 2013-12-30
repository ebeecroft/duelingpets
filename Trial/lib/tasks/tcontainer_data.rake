namespace :db do
   task populate: :environment do
      tutorial = Tcontainer.create!(name: "Tutorials",
                           forum_id: 1)
      tutorial.user_id = 1
      tutorial.save
   end
end
