class Narrative < ActiveRecord::Base
   belongs_to :subtopic
   attr_accessible :story, :subtopic_id, :user_id
end
