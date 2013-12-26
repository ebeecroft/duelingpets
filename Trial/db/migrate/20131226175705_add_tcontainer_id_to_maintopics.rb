class AddTcontainerIdToMaintopics < ActiveRecord::Migration
  def change
    add_column :maintopics, :tcontainer_id, :integer
  end
end
