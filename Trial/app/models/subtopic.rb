class Subtopic < ActiveRecord::Base
   belongs_to :maintopic
   belongs_to :user
   has_many :narratives
   attr_accessible :description, :maintopic_id, :topicname, :user_id
end
