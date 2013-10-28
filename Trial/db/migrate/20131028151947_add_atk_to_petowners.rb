class AddAtkToPetowners < ActiveRecord::Migration
  def change
    add_column :petowners, :atk, :integer
  end
end
