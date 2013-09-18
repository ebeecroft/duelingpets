class CreatePetItems < ActiveRecord::Migration
  def change
    create_table :pet_items do |t|
      t.integer :id
      t.integer :petown_id
      t.integer :item_id
      t.boolean :reusable

      t.timestamps
    end
  end
end
