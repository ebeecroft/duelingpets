class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.bigint :id
      t.varchar :first_name
      t.varchar :last_name
      t.varchar :email
      t.varchar :vname
      t.password :password
      t.password :confirm
      t.int :money
      t.tinyint :admin
      t.date :joined_on
      t.tinyint :maintenance

      t.timestamps
    end
  end
end
