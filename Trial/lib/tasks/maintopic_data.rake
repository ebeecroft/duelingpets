namespace :db do
   task populate: :environment do
      #Builds the topic describing registration
      signup = Maintopic.create!(topicname: "Sign Up",
                           description: "If your new to creating an account be sure to click on one of the lessons after clicking on the maintopic Sign Up",
                           user_id: 1)
      signup.tcontainer_id = 1
      signup.save

      #Builds the topic describing login
      signin = Maintopic.create!(topicname: "Sign In",
                           description: "If your new to logging in be sure to click on one of the lessons after clicking on the maintopic Sign In",
                           user_id: 1)
      signin.tcontainer_id = 1
      signin.save

      #Builds the topic describing logout
      logout = Maintopic.create!(topicname: "Log Out",
                           description: "If your new to logging out be sure to click on one of the lessons after clicking on the maintopic Log Out",
                           user_id: 1)
      logout.tcontainer_id = 1
      logout.save

      #Builds the topic describing user profile
      profile = Maintopic.create!(topicname: "User Profile",
                           description: "If your new to the user profile be sure to click on one of the lessons after clicking on the maintopic User Profile",
                           user_id: 1)
      profile.tcontainer_id = 2
      profile.save

      #Builds the topic describing pet adoption
      adopt = Maintopic.create!(topicname: "Pet Adoption",
                           description: "If your new to pet adoption be sure to click on one of the lessons after clicking on the maintopic Pet Adoption",
                           user_id: 1)
      adopt.tcontainer_id = 2
      adopt.save

      #Builds the topic describing fighting monsters
      monsters = Maintopic.create!(topicname: "Fight Monsters",
                           description: "If your new to fighting monsters be sure to click on one of the lessons after clicking on the maintopic Fight Monsters",
                           user_id: 1)
      monsters.tcontainer_id = 2
      monsters.save

      #Builds the topic describing the forum
      forum = Maintopic.create!(topicname: "Forum",
                           description: "If your new to the forum be sure to click on one of the lessons after clicking on the maintopic Forum",
                           user_id: 1)
      forum.tcontainer_id = 3
      forum.save

      #Builds the topic describing shop
      shop = Maintopic.create!(topicname: "Shop",
                           description: "If your new to the shop be sure to click on one of the lessons after clicking on the maintopic Shop",
                           user_id: 1)
      shop.tcontainer_id = 3
      shop.save
   end
end
