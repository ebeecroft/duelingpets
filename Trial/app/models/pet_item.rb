class PetItem < ActiveRecord::Base
  attr_accessible :id, :item_id, :petown_id, :reusable
end
