class Petowner < ActiveRecord::Base
  attr_accessible :adopted_on, :pet_id, :pet_name, :user_id
  belongs_to :pet
  belongs_to :user

  #validates :user_id, presence: true
  #validates :pet_id, presence: true
  #validates :pet_name, presence: true, uniqueness:{:scope => [:pet_id, :user_id, case_sensitive: false]}
  validates :pet_name, presence: true, uniqueness: { case_sensitive: false, :scope =>[:user_id, :pet_id]} #current setting applies to just a pet_id and not a user.
end
