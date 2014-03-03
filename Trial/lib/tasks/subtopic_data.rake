namespace :db do
   task populate: :environment do
      #Mary had a little lamb
      mary = Subtopic.create!(topicname: "Mary had a little lamb",
                           description: "Mary had a little lamb its fleace was white as snow.",
                           maintopic_id: 6,
                           user_id: 3)
      mary.created_on = Time.now
      mary.save
   end
end
