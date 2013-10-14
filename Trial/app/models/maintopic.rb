class Maintopic < ActiveRecord::Base
   belongs_to :user
   has_many :subtopics, :foreign_key => "maintopic_id", :dependent => :destroy
  attr_accessible :description, :topicname, :user_id
end
