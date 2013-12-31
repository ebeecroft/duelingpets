namespace :db do
   task populate: :environment do
      #Registration Lesson
      reglesson = Subtopic.create!(topicname: "Lesson 1 Creating an account",
                           description: "In this tutorial users will learn how to create an account. Under normal conditions guests will access the homepage of the website. To create an account a guest will fill in the necessary information such as name, email, vname, and password fields. If the information is not invalid the user will be redirected to the user's profile. If the data is invalid then an error message will tell the guest specifically what the problem is and how to correct it.",
                           maintopic_id: 1,
                           user_id: 1)
      reglesson.save

      #Login Lesson
      loginlesson = Subtopic.create!(topicname: "Lesson 2 Signing into an account",
                           description: "In this tutorial users will learn how to login to an account. Under normal conditions guests will be accessing the homepage of the website and will have a user account already created. To login to an account a guest must first click the sign in link above the navigation bar. Once the guest has clicked the link they will be redirected to the sign in page where they will be prompted for a vname and a password. A guest who fills in a valid vname and password, and clicks the submit button will be directed to their user profile that they created in the Creating an account lesson. If the guest entered an invalid combination or the account doesn't exist an error message will be displayed letting the guest know that either the vname or password is incorrect and must be changed in order to login in successfully.",
                           maintopic_id: 2,
                           user_id: 1)
      loginlesson.save

      #Logout Lesson
      logoutlesson = Subtopic.create!(topicname: "Lesson 3 Logging out of an account",
                           description: "In this tutorial users will learn how to logout of an account. Under normal conditions users will logged in to their account. To logout of an account a user must click the logout link that is above the navigation bar. Once clicked the user's session will be terminated and the user will be redirected back to the homepage of the website. At this point the user will see the signin and signup links which indicate that the user is now a guest of the website.",
                           maintopic_id: 3,
                           user_id: 1)
      logoutlesson.save

      #User Profile Lesson
      profilelesson = Subtopic.create!(topicname: "Lesson 4 Accessing a user's profile",
                           description: "In this tutorial users will learn how to access the profile that they own. Under normal conditions users will be accessing the homepage of the website. To access the user's profile a user will need to click the user's profile name link which is above the navigation bar. Once clicked the user will be directed to their profile page which will display information about themselves. On that page the user will be able to see the amount of dp(duelingpet) points they have available, link to create a new forum, and the ability to write a comment on their own profile.",
                           maintopic_id: 4,
                           user_id: 1)
      profilelesson.save

      #Pet Adoption Lesson
      adoptlesson = Subtopic.create!(topicname: "Lesson 5 Adopting a pet",
                           description: "In this tutorial users will learn how to adopt a pet. Under normal conditions users will be logged in to their account. To adopt a pet a user must first click the adopt a pet link on the navigation bar. Next the user will be presented with a selection of pets to choose from. If this is the user's first time adopting a pet they will have a choice between the three starter pets that are available. In order to select a pet a user must click one of the radio buttons above the image of the pet and click the adopt selected pet button. The user will then be presented with a name box to name their given pet and another button to adopt the pet itself. Once the user has succesfully processed this step the user will then be directed to their my pets page which will display their newly adopted pet.",
                           maintopic_id: 5,
                           user_id: 1)
      adoptlesson.save

      #Fight Monster Lesson
      monsterlesson = Subtopic.create!(topicname: "Lesson 6 Fight monster",
                           description: "In this tutorial users will learn how to fight a monster. Under normal conditions users will be logged in to their account. To fight a monster a user must first click the fight monster link on the navigation bar. Once clicked the user will be directed to the monsters page with several monster to choose from, at the top of the page will be a drop down select box containing the user's owned pets. Only pets that have health points > 0 or not engaged in a fight will be able to battle monsters. In order to engage in a battle, a user must first select the pet they want to battle with and a monster to be chosen from a radio button. Once the information has been finalized the user will then be able to click the fight button. After the button is clicked the user will be redirect to the fight page and will see his/her pet engaged in battle against the chosen monster.",
                           maintopic_id: 6,
                           user_id: 1)
      monsterlesson.save

      #Shop Lesson
      shoplesson = Subtopic.create!(topicname: "Lesson 7 Purchasing items",
                           description: "In this tutorial users will learn how to purchase items. Under normal conditions users will be logged in to their account. To purchase an item a user must first click the shop link on the navigation bar. Next the user will be redirect to the items page and presented with a selection of items to choose from. A user can select an item by clicking the radio button above the images picture and clicking the purchase button. Once the purchase item button is clicked the user's dp points are decremented based on the items cost and the user is directed to their inventory that shows the recently purchased item. If the user didn't have enough money for the item then the user will be directed back to the shop and will be presented with the option to purchase something else and an error message will be displayed.",
                           maintopic_id: 7,
                           user_id: 1)
      shoplesson.save

      #Forum Lesson
      forumlesson = Subtopic.create!(topicname: "Lesson 8 Creating A topic container",
                           description: "In this tutorial users will learn how to create a topic container. Normally under default conditions a forum topic container may only be created by the forum owner. However since the button all users has been set any user can create a new container. To create a topic container a user must click the new tcontainer link. Once there a user will be prompted with the name of the topic containers and a create topic button at the bottom. Once the data has been all filled out and the button has been clicked the user will then be directed to the new container and you will have completed lesson 1.",
                           maintopic_id: 8,
                           user_id: 1)
      forumlesson.save
   end
end
