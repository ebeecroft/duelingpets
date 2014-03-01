class Equip < ActiveRecord::Base
  belongs_to :petowner
  belongs_to :inventory
end
