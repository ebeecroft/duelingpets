class AddDamageToFights < ActiveRecord::Migration
  def change
    add_column :fights, :damage, :integer
  end
end
