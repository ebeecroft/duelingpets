namespace :db do
   task populate: :environment do
      tutorial = Subtopic.create!(topicname: "Lesson 1 Creating A topic container",
                           description: "In this tutorial users will learn how to create a topic container. Normally under default conditions a forum topic container may only be created by the forum owner. However since the button all users has been set any user can create a new container. To create a topic container a user must click the new tcontainer link. Once there a user will be prompted with the name of the topic containers and a create topic button at the bottom. Once the data has been all filled out and the button has been clicked the user will then be directed to the new container and you will have completed lesson 1.",
                           maintopic_id: 1,
                           user_id: 1)
      tutorial.save
   end
end
