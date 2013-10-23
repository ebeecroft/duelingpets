class Pet < ActiveRecord::Base
  attr_accessible :description, :species_name, :level, :hp, :atk, :def, :spd, :cost

  has_many :petowners, :foreign_key => "pet_id", :dependent => :destroy
  has_many :fights, :foreign_key => "monster_id", :dependent => :destroy
  validates :species_name, presence: true, uniqueness: { case_sensitive: false}
  validates :description, presence: true

  def to_param
     species_name
  end
end
