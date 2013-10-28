class AddMaintenanceToNarratives < ActiveRecord::Migration
  def change
    add_column :narratives, :maintenance, :boolean
  end
end
