class AddIpictureToItems < ActiveRecord::Migration
  def change
    add_column :items, :ipicture, :string
  end
end
