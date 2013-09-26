class Item < ActiveRecord::Base
  attr_accessible :description, :name
  validates :description, presence: true
  validates :name, presence: true
end
