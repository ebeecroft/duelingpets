class CreateSubtopics < ActiveRecord::Migration
  def change
    create_table :subtopics do |t|
      t.integer :id
      t.integer :main_id
      t.integer :user_id
      t.string :topicname
      t.date :created_on
      t.boolean :maintenance

      t.timestamps
    end
  end
end
