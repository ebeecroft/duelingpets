class AddCreatedOnToMaintopics < ActiveRecord::Migration
  def change
    add_column :maintopics, :created_on, :date
  end
end
