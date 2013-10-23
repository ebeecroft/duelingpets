class AddHpToPets < ActiveRecord::Migration
  def change
    add_column :pets, :hp, :integer, default: 1
  end
end
