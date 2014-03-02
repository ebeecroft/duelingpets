class Narrative < ActiveRecord::Base
   belongs_to :subtopic
   belongs_to :user
   attr_accessible :story
   VALID_NARRATIVE_REGEX = /\A[ A-Za-z0-9:!)("',.?-]+\z/
   validates :story, presence: true, format: { with: VALID_NARRATIVE_REGEX}
end
