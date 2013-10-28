class AddRoundToFights < ActiveRecord::Migration
  def change
    add_column :fights, :round, :integer
  end
end
