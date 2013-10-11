class Inventory < ActiveRecord::Base
   belongs_to :item
   belongs_to :user
   has_many :equips, :foreign_key => "inventory_id", :dependent => :destroy

   validates :user_id, presence: true, :uniqueness => {:scope => :item_id}
   validates :item_id, presence: true
   attr_accessible :item_id, :user_id
end
