class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :vname, :password, :password_confirmation, :avatar
  mount_uploader :avatar, AvatarUploader
has_secure_password

before_save { |user| user.email = user.email.downcase }
before_save { |user| user.first_name = user.first_name.humanize }
before_save :create_remember_token

has_many :petowners
has_many :pets, :through => :petowners
has_many :inventories, :foreign_key => "user_id", :dependent => :destroy
has_many :comments, :foreign_key => "user_id", :dependent => :destroy
has_many :maintopics
has_many :subtopics
has_many :narratives
has_one :pouch, :foreign_key => "user_id", :dependent => :destroy
has_many :forums

#validates :first_name, presence: true
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
VALID_NAME_REGEX = /\A[a-z][a-z][a-z]+\z/i
VALID_VNAME_REGEX = /\A[A-Za-z][A-Za-z][A-Za-z][A-Za-z0-9 ]+([-][A-Za-z0-9 ]+)?\z/
VALID_PASSWORD_REGEX = /\A[A-Za-z0-9!][A-Za-z0-9!][A-Za-z0-9!][A-Za-z0-9!][A-Za-z0-9!][A-Za-z0-9!]+\z/
validates :first_name, presence: true, format: { with: VALID_NAME_REGEX}
validates :last_name, presence: true, format: { with: VALID_NAME_REGEX}
validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}
validates :vname, presence: true, format: { with: VALID_VNAME_REGEX}, uniqueness: { case_sensitive: false}
validates :password, length: {minimum: 6}, format: { with: VALID_PASSWORD_REGEX}
validates :password_confirmation, presence: true, format: { with: VALID_PASSWORD_REGEX}

def to_param
   vname
end

private
   def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
   end
end
