class AddCreatedOnToSubtopics < ActiveRecord::Migration
  def change
    add_column :subtopics, :created_on, :date
  end
end
