class AddLevelToPets < ActiveRecord::Migration
  def change
    add_column :pets, :level, :integer, default: 1
  end
end
