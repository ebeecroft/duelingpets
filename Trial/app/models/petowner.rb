class Petowner < ActiveRecord::Base
  attr_accessible :adopted_on, :pet_id, :pet_name, :user_id
  belongs_to :pet
  belongs_to :user
end
