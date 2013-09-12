class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.bigint :id
      t.varchar :species_name
      t.varchar :description
      t.longblob :image
      t.int :level
      t.int :hp
      t.int :def
      t.int :atk
      t.int :spd
      t.int :cost
      t.tinyint :p_m_r
      t.bigint :created_by
      t.date :created_on

      t.timestamps
    end
  end
end
