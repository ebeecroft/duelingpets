class Comment < ActiveRecord::Base
  attr_accessible :message, :author, :user_id
  belongs_to :user
end
