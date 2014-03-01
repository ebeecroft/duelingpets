class Tcontainer < ActiveRecord::Base
  attr_accessible :name
  has_many :maintopics, :dependent => :destroy
  belongs_to :forum

  VALID_CONTAINER_REGEX = /\A[A-Za-z0-9 ]+\z/
  validates :name, presence: true, format: { with: VALID_CONTAINER_REGEX}
end
