class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.bigint :id
      t.bigint :user_id
      t.bigint :item_id

      t.timestamps
    end
  end
end
