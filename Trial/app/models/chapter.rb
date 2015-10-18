class Chapter < ActiveRecord::Base
   attr_accessible :title, :story
   belongs_to :book
   belongs_to :gchapter
   belongs_to :user
end
