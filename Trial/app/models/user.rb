class User < ActiveRecord::Base
  attr_accessible :admin, :confirm, :email, :first_name, :id, :joined_on, :last_name, :maintenance, :money, :password, :vname
end
