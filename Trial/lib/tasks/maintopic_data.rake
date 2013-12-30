namespace :db do
   task populate: :environment do
      tutorial = Maintopic.create!(topicname: "Tutorials",
                           description: "If your new to the forum be sure to click on one of the lessons after clicking on the maintopic Tutorials",
                           user_id: 1)
      tutorial.tcontainer_id = 1
      tutorial.save
   end
end
