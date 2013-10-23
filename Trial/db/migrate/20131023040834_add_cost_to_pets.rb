class AddCostToPets < ActiveRecord::Migration
  def change
    add_column :pets, :cost, :integer, default: 1
  end
end
