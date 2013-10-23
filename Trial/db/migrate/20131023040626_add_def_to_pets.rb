class AddDefToPets < ActiveRecord::Migration
  def change
    add_column :pets, :def, :integer, default: 1
  end
end
