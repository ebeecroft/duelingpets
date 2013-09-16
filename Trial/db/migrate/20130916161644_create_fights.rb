class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.bigint :id
      t.bigint :petown_id
      t.bigint :monster_id
      t.int :round
      t.int :damage
      t.tiny :miss

      t.timestamps
    end
  end
end
