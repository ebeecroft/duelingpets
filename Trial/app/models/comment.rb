class Comment < ActiveRecord::Base
  attr_accessible :message
  #Makes one table into two for users
  belongs_to :from_user, :class_name => 'User', :foreign_key => 'from_user_id'
  belongs_to :to_user, :class_name => 'User', :foreign_key => 'user_id'
end
