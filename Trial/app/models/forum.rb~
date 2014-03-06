class Forum < ActiveRecord::Base
  attr_accessible :description, :name
  belongs_to :user
  has_many :tcontainers, :dependent => :destroy
  VALID_FORUM_REGEX = /\A[A-Za-z0-9]+\z/
  validates :name, presence: true, format: { with: VALID_FORUM_REGEX}, uniqueness: { case_sensitive: false}
  validates :description, presence: true

  def to_param
     name
  end
end
