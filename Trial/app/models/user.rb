class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :vname, :password, :password_confirmation
has_secure_password

validates :first_name, presence: true
validates :last_name, presence: true
validates :email, presence: true
validates :vname, presence: true, uniqueness: { case_sensitive: false}
validates :password, presence: true, length: {minimum: 6}
validates :password_confirmation, presence: true
end
