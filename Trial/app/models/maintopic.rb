class Maintopic < ActiveRecord::Base
   belongs_to :user
   belongs_to :tcontainer
   has_many :subtopics, :foreign_key => "maintopic_id", :dependent => :destroy
   attr_accessible :description, :topicname, :tcontainer_id
   VALID_TOPIC_REGEX = /\A[A-Za-z0-9 ]+\z/
   validates :topicname, presence: true, format: { with: VALID_TOPIC_REGEX}
   validates :description, presence: true
end
