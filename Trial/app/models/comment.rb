class Comment < ActiveRecord::Base
  attr_accessible :message, :user_id
end
