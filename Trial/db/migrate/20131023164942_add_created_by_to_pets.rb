class AddCreatedByToPets < ActiveRecord::Migration
  def change
    add_column :pets, :created_by, :string
  end
end
