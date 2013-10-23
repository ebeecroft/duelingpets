class AddAtkToPets < ActiveRecord::Migration
  def change
    add_column :pets, :atk, :integer, default: 1
  end
end
