class Item < ActiveRecord::Base
  attr_accessible :atk, :cost, :created_at, :def, :description, :equip_flag, :hp, :id, :image, :maintenance, :name, :spd, :type
end
