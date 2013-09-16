class Comment < ActiveRecord::Base
  attr_accessible :created_at, :id, :maintenance, :message, :user_id
end
