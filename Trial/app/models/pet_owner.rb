class PetOwner < ActiveRecord::Base
  attr_accessible :atk, :def, :exp, :hp, :hp_max, :id, :level, :name, :pet_id, :spd, :user_id
end
