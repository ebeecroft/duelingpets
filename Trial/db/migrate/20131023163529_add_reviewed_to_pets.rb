class AddReviewedToPets < ActiveRecord::Migration
  def change
    add_column :pets, :reviewed, :boolean, default: false
  end
end
