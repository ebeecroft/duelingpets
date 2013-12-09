class AddBattleDoneToFights < ActiveRecord::Migration
  def change
    add_column :fights, :battle_done, :boolean, default: false
  end
end
