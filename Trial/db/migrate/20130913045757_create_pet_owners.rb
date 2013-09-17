class CreatePetOwners < ActiveRecord::Migration
  def change
    create_table :pet_owners do |t|
      t.integer :id
      t.integer :user_id
      t.integer :pet_id
      t.string :name
      t.integer :level
      t.integer :hp
      t.integer :def
      t.integer :atk
      t.integer :spd
      t.integer :hp_max
      t.integer :exp

      t.timestamps
    end
  end
end
