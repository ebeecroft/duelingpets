class AddMaintenanceToUsers < ActiveRecord::Migration
  def change
    add_column :users, :maintenance, :boolean, default: false
  end
end
