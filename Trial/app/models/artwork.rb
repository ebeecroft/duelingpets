class Artwork < ActiveRecord::Base
  attr_accessible :created_on, :description, :maintenance, :reviewed, :subfolder_id, :title, :user_id
end
