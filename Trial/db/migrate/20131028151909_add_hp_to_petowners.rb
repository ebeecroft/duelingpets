class AddHpToPetowners < ActiveRecord::Migration
  def change
    add_column :petowners, :hp, :integer
  end
end
