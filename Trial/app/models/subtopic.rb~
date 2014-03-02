class Subtopic < ActiveRecord::Base
   belongs_to :maintopic
   belongs_to :user
   has_many :narratives, :foreign_key => "subtopic_id", :dependent => :destroy
   attr_accessible :description, :maintopic_id, :topicname
   VALID_TOPIC_REGEX = /\A[A-Za-z0-9 ]+\z/
   VALID_DESCRIPTION_REGEX = /\A[ A-Za-z0-9:-]+\z/
   validates :topicname, presence: true, format: { with: VALID_TOPIC_REGEX}
   validates :description, presence: true, format: { with: VALID_DESCRIPTION_REGEX}
end
