namespace :db do
   task populate: :environment do

      #Builds the admin's pouch
      adminmoney = Pouch.create!(user_id: 1)
      adminmoney.amount = 200
      adminmoney.save

      #Builds the petcreator pouch
      creatormoney = Pouch.create!(user_id: 2)
      creatormoney.amount = 200
      creatormoney.save


      #Builds the forumowner pouch
      forummoney = Pouch.create!(user_id: 3)
      forummoney.amount = 200
      forummoney.save
   end
end
