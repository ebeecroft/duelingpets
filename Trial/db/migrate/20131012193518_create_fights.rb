class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :petowner_id
      t.integer :monster_id

      t.timestamps
    end
  end
end
