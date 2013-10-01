class Pet < ActiveRecord::Base
  attr_accessible :description, :species_name

  has_many :petowners
  validates :species_name, presence: true, uniqueness: { case_sensitive: false}
  validates :description, presence: true
end
