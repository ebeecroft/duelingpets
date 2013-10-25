class AddLevelToPetowners < ActiveRecord::Migration
  def change
    add_column :petowners, :level, :integer
  end
end
