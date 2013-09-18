class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :joined_on, :last_name, :vname
end
