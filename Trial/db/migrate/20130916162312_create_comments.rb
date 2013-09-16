class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.bigint :id
      t.bigint :user_id
      t.varchar :message
      t.date :created_at
      t.tinyint :maintenance

      t.timestamps
    end
  end
end
