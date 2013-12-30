class AddInfoToFights < ActiveRecord::Migration
  def change
    add_column :fights, :round, :integer
    add_column :fights, :pdamage, :integer
    add_column :fights, :mdamage, :integer
    add_column :fights, :p_miss, :boolean, default: false
    add_column :fights, :m_miss, :boolean, default: false
    add_column :fights, :mhp, :integer
    add_column :fights, :battle_done, :boolean, default: false
  end
end
