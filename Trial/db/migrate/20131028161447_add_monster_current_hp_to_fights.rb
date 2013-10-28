class AddMonsterCurrentHpToFights < ActiveRecord::Migration
  def change
    add_column :fights, :monster_current_hp, :integer
  end
end
