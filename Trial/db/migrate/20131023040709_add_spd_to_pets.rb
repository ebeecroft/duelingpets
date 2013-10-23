class AddSpdToPets < ActiveRecord::Migration
  def change
    add_column :pets, :spd, :integer, default: 1
  end
end
