class AddMaintenanceToComments < ActiveRecord::Migration
  def change
    add_column :comments, :maintenance, :boolean
  end
end
