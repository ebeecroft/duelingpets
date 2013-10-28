class AddMaintenanceToMaintopics < ActiveRecord::Migration
  def change
    add_column :maintopics, :maintenance, :boolean
  end
end
