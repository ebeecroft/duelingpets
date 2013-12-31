namespace :db do
   task populate: :environment do
      #Builds the topic describing pet adoption
      adopt = Maintopic.create!(topicname: "Pet Adoption",
                           description: "If your new to pet adoption be sure to click on one of the lessons after clicking on the maintopic Pet Adoption",
                           user_id: 1)
      adopt.tcontainer_id = 1
      adopt.save

      #Builds the topic describing fighting monsters
      monsters = Maintopic.create!(topicname: "Fight Monsters",
                           description: "If your new to fighting monsters be sure to click on one of the lessons after clicking on the maintopic Fight Monsters",
                           user_id: 1)
      monsters.tcontainer_id = 1
      monsters.save

      #Builds the topic describing shop
      shop = Maintopic.create!(topicname: "Shop",
                           description: "If your new to the shop be sure to click on one of the lessons after clicking on the maintopic Shop",
                           user_id: 1)
      shop.tcontainer_id = 1
      shop.save

      #Builds the topic describing the forum
      forum = Maintopic.create!(topicname: "Forum",
                           description: "If your new to the forum be sure to click on one of the lessons after clicking on the maintopic Forum",
                           user_id: 1)
      forum.tcontainer_id = 2
      forum.save
   end
end
