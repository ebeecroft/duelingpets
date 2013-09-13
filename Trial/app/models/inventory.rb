class Inventory < ActiveRecord::Base
  attr_accessible :id, :item_id, :user_id
end
