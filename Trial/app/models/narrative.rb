class Narrative < ActiveRecord::Base
  attr_accessible :created_on, :id, :maintenance, :story, :sub_id, :user_id
end
