class Subtopic < ActiveRecord::Base
  attr_accessible :created_on, :id, :main_id, :maintenance, :topicname, :user_id
end
