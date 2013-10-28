class AddDefToPetowners < ActiveRecord::Migration
  def change
    add_column :petowners, :def, :integer
  end
end
