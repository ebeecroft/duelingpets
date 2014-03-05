namespace :db do
   task populate: :environment do

      #Builds the admin's pouch
      adminmoney = Pouch.create!
      adminmoney.user_id = 1
      adminmoney.amount = 200
      adminmoney.save

      #Builds the petcreator pouch
      creatormoney = Pouch.create!
      creatormoney.user_id = 2
      creatormoney.amount = 200
      creatormoney.save


      #Builds the forumowner pouch
      forummoney = Pouch.create!
      forummoney.user_id = 3
      forummoney.amount = 200
      forummoney.save
   end
end
