class AddHpMaxToPetowners < ActiveRecord::Migration
  def change
    add_column :petowners, :hp_max, :integer
  end
end
