class AddManyusesToItems < ActiveRecord::Migration
  def change
    add_column :items, :manyuses, :boolean
  end
end
