class Tcontainer < ActiveRecord::Base
  attr_accessible :forum_id, :name
  has_many :maintopics
  belongs_to :forum
end
