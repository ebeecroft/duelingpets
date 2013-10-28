class AddMaintenanceToSubtopics < ActiveRecord::Migration
  def change
    add_column :subtopics, :maintenance, :boolean
  end
end
