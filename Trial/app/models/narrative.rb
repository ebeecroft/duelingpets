class Narrative < ActiveRecord::Base
  attr_accessible :story, :subtopic_id, :user_id
end
