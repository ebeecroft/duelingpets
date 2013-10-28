class AddExpToPetowners < ActiveRecord::Migration
  def change
    add_column :petowners, :exp, :integer
  end
end
