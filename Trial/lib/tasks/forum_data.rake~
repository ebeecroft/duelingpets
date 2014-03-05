namespace :db do
   task populate: :environment do
      tutorial = Forum.create!(name: "Tutorial",
                           description: "This is a tutorial forum to teach new users how to build build a forum on their own. Users should pay careful attention to the instructions if they wish to master the new system. Please take a look at the various topics first")
      tutorial.user_id = 3
      tutorial.created_on = Time.now
      tutorial.save
   end
end
