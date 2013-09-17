class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :id
      t.string :name
      t.binary :image
      t.text :description
      t.integer :hp
      t.integer :atk
      t.integer :def
      t.integer :spd
      t.integer :cost
      t.boolean :equip_flag
      t.string :type
      t.date :created_at
      t.boolean :maintenance

      t.timestamps
    end
  end
end
