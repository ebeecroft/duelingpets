class Maintopic < ActiveRecord::Base
   has_many :subtopics, :foreign_key => "maintopic_id", :dependent => :destroy
  attr_accessible :description, :topicname, :user_id
end
