class Sessionkey < ActiveRecord::Base
  attr_accessible :expiretime, :remember_token, :user_id
end
