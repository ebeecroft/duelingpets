class AddCreatedOnToNarratives < ActiveRecord::Migration
  def change
    add_column :narratives, :created_on, :date
  end
end
