class Comment < ActiveRecord::Base
  attr_accessible :message, :user_id, :from_user_id
  #This is necessary for making the classes understandable
  belongs_to :from_user, :class_name => 'User', :foreign_key => 'from_user_id'
  belongs_to :to_user, :class_name => 'User', :foreign_key => 'user_id'
end

#belongs_to :buyer, :class_name => 'User', :foreign_key => 'buyer_id'
#  belongs_to :seller, :class_name => 'User', :foreign_key => 'seller_id'

