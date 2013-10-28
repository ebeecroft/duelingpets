class AddMissToFights < ActiveRecord::Migration
  def change
    add_column :fights, :miss, :boolean
  end
end
