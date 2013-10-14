class Comment < ActiveRecord::Base
  attr_accessible :message, :author_id
  belongs_to :user
end
