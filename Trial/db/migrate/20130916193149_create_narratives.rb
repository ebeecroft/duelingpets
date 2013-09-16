class CreateNarratives < ActiveRecord::Migration
  def change
    create_table :narratives do |t|
      t.bigint :id
      t.bigint :sub_id
      t.bigint :user_id
      t.varchar :story
      t.date :created_on
      t.tinyint :maintenance

      t.timestamps
    end
  end
end
