class Equip < ActiveRecord::Base
  attr_accessible :inventory_id, :petowner_id
  belongs_to :petowner
  belongs_to :inventory
end
