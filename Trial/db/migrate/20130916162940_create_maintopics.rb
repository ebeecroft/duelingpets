class CreateMaintopics < ActiveRecord::Migration
  def change
    create_table :maintopics do |t|
      t.integer :id
      t.integer :user_id
      t.string :topicname
      t.date :created_on
      t.boolean :maintenance

      t.timestamps
    end
  end
end
