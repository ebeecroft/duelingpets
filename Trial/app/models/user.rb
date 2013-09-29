class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :vname, :password, :password_confirmation
has_secure_password

before_save { |user| user.email = user.email.downcase }

has_many :pet_owners
has_many :pets, :through => :pet_owners
has_many :inventories, :foreign_key => "user_id", :dependent => :destroy
validates :first_name, presence: true
validates :last_name, presence: true
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}
validates :vname, presence: true, uniqueness: { case_sensitive: false}
validates :password, length: {minimum: 6}
validates :password_confirmation, presence: true
end
