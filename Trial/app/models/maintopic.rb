class Maintopic < ActiveRecord::Base
  attr_accessible :created_on, :id, :maintenance, :topicname, :user_id
end
