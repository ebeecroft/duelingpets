class Fight < ActiveRecord::Base
  attr_accessible :damage, :id, :miss, :monster_id, :petown_id, :round
end
