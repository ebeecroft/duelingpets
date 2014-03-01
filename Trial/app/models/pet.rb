class Pet < ActiveRecord::Base
  attr_accessible :description, :species_name, :hp, :atk, :def, :spd, :monster, :image, :remote_image_url
  has_many :petowners, :foreign_key => "pet_id", :dependent => :destroy
  has_many :fights, :foreign_key => "pet_id", :dependent => :destroy
  mount_uploader :image, ImageUploader

  #Regex code to validate the presence of a correct pet
  VALID_HP_REGEX = /\A[0-9]+\z/
  VALID_ATK_REGEX = /\A[0-9]+\z/
  VALID_DEF_REGEX = /\A[0-9]+\z/
  VALID_SPD_REGEX = /\A[0-9]+\z/
  VALID_SPECIES_REGEX = /\A[A-Za-z0-9 ]+\z/
  VALID_DESCRIPTION_REGEX = /\A[a-z0-9 ]+\z/i
  validates :species_name, presence: true, format: { with: VALID_SPECIES_REGEX}, uniqueness: { case_sensitive: false}
  validates :description, presence: true, format: { with: VALID_DESCRIPTION_REGEX}
  validates :hp, presence: true, format: { with: VALID_HP_REGEX}
  validates :atk, presence: true, format: { with: VALID_ATK_REGEX}
  validates :def, presence: true, format: { with: VALID_DEF_REGEX}
  validates :spd, presence: true, format: { with: VALID_SPD_REGEX}

  def to_param
     species_name
  end
end
