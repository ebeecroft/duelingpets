class Subtopic < ActiveRecord::Base
   belongs_to :maintopic
  attr_accessible :description, :main_id, :topicname, :user_id
end
