class Pet < ActiveRecord::Base
  attr_accessible :atk, :cost, :created_by, :created_on, :def, :description, :hp, :id, :image, :level, :p_m_r, :spd, :species_name
end
