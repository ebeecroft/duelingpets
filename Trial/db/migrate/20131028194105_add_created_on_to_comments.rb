class AddCreatedOnToComments < ActiveRecord::Migration
  def change
    add_column :comments, :created_on, :date
  end
end
