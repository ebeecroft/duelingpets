class AddSpdToPetowners < ActiveRecord::Migration
  def change
    add_column :petowners, :spd, :integer
  end
end
