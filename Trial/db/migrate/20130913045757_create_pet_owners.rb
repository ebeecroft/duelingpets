class CreatePetOwners < ActiveRecord::Migration
  def change
    create_table :pet_owners do |t|
      t.bigint :id
      t.bigint :user_id
      t.bigint :pet_id
      t.varchar :name
      t.int :level
      t.int :hp
      t.int :def
      t.int :atk
      t.int :spd
      t.int :hp_max
      t.int :exp

      t.timestamps
    end
  end
end
