namespace :db do
   task populate: :environment do
      adminmoney = Pouch.create!(user_id: 1)
      adminmoney.amount = 200
      adminmoney.save
   end
end
