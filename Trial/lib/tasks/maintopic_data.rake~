namespace :db do
   task populate: :environment do
      #Builds the topic describing narratives (Basic Section starts here)
      narrative = Maintopic.create!(topicname: "Narrative Explanation",
                           description: "Narratives is how new users to this forum are able to communicate with each other and progress stories. This is one of the basic skills to learn on this new system. By selecting the New Narrative link below the given subtopic they will then be able to type in their given story and it will be added to the current one. Try this out for yourself after clicking on the Mary had a little lamb Subtopic below this maintopic. If you do this you will have successfully posted your first narrative.",
                           user_id: 3)
      narrative.tcontainer_id = 1
      narrative.created_on = Time.now
      narrative.save

      #Builds the topic describing subtopics (Basic Section)
      subtopic = Maintopic.create!(topicname: "Subtopics Explanation",
                           description: "Subtopics are different then Narratives, when a Subtopic is created it sets the foundation for the start of a story and provides a type of cover for the Maintopics. With a subtopic it allows the maintopic to expand a great deal such as for Character Registration. Below one maintopic a user can create many different individual registrations based specifically on a species with out leaving the mess on the main part of forum, providing a very clean interface. To create a new subtopic, one clicks the New Subtopic link below the given maintopic and is presented with entering both a topicname and a description to be filled out and once submitted will be added to the selected maintopic. Try this out for yourself after clicking on the Fairy tales Maintopic. If you do this, you will have successfully posted your first subtopic.",
                           user_id: 3)
      subtopic.tcontainer_id = 1
      subtopic.created_on = Time.now
      subtopic.save

      #Builds the topic describing maintopics (Intermediate Section starts here)
      maintopic = Maintopic.create!(topicname: "Maintopics Explanation",
                           description: "Maintopics are the most general topics, they are near the top level of the forum and can encompass a wide variety of subtopics. Usually one does not create a lot of these topics, because the subtopics give more specifics about what the maintopic will be about. Generally only 1-3 maintopics are needed per Topic Container to keep the forum neat and provide useful features. In order to create a new maintopic, a user would select a Topic Container first and then on that page the user would click the create new Maintopic link. Once you have done that you will be asked to provide a topicname and a description which after clicking the submit button, the new maintopic will be created underneath the given Topic Container. Try this out for yourself by clicking on the Stories Topic Container. If you do this, you will have successfully posted your first maintopic.",
                           user_id: 3)
      maintopic.tcontainer_id = 2
      maintopic.created_on = Time.now
      maintopic.save

      #Builds the topic describing tcontainers (Intermediate Section)
      container = Maintopic.create!(topicname: "Topic Container Explanation",
                           description: "Topic Containers(Tcontainers for short) are the highest level of the forum and provide the building blocks neccessary to create a good forum. A single TContainer may contain several maintopics of which 2-3 is recommended. The thing to remember about Topic Containers is to use them sparingly similiar to the Maintopics. To create a new Tcontainer a user would first select a forum and then click the new Tcontainer link. Once the user has done that he/she would then type in the container name and click the submit button, the new topic container will appear below the given forum. Try this out for yourself on the Tutorial Forum. If you do this, you will have successfully posted your first Tcontainer.",
                           user_id: 3)
      container.tcontainer_id = 2
      container.created_on = Time.now
      container.save

This is unlike 2 tier forums which only contain a topic and replies, in a two tier system topics are connected directly too replies.

      #Builds the topic describing forums (Advanced Section)
      forum = Maintopic.create!(topicname: "Forum Explanation",
                           description: "Since you now have learned all the basics and intermediate steps prior to this you will be now able to successfully create your own forum. In order to create your own forum all you need to do is simply click the new forum link on your profile and you will be able to get yourself started. Once there type in the name of the forum and description you want and click submit. Once you have done this, you will finally have your own forum. I am hoping you found these tutorials useful, if you need refreshers feel free to come back and look at the examples. I wish your forum creating experience to be a very successful one. Good Luck! :)",
                           user_id: 3)
      forum.tcontainer_id = 3
      forum.created_on = Time.now
      forum.save

      #Builds the topic Fairy Tales (A simple story)
      fairy = Maintopic.create!(topicname: "Fairy Tales",
                           description: "A collection of simple stories.",
                           user_id: 3)
      fairy.tcontainer_id = 4
      fairy.created_on = Time.now
      fairy.save
   end
end
