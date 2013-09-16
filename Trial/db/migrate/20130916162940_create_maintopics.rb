class CreateMaintopics < ActiveRecord::Migration
  def change
    create_table :maintopics do |t|
      t.bigint :id
      t.bigint :user_id
      t.varchar :topicname
      t.date :created_on
      t.tinyint :maintenance

      t.timestamps
    end
  end
end
