class Forum < ActiveRecord::Base
  attr_accessible :description, :name, :user_id
  belongs_to :user
  has_many :tcontainers
  def to_param
     name
  end

  validates :name, presence: true, uniqueness: { case_sensitive: false}
#validates :pet_name, presence: true, uniqueness: { case_sensitive: false, :scope =>[:user_id, :pet_id]} #current setting applies to just a pet_id and not a user.
end
