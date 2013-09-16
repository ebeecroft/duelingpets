class CreatePetItems < ActiveRecord::Migration
  def change
    create_table :pet_items do |t|
      t.bigint :id
      t.bigint :petown_id
      t.bigint :item_id
      t.tinyint :reusable

      t.timestamps
    end
  end
end
