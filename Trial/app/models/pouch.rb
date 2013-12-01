class Pouch < ActiveRecord::Base
  attr_accessible :user_id, :amount
  belongs_to :user
end
