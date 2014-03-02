class Item < ActiveRecord::Base
#   has_many :attendances, :foreign_key => "groupee_id", :dependent => :destroy
   has_many :inventories, :foreign_key => "item_id", :dependent => :destroy
  attr_accessible :description, :name, :hp, :atk, :def, :spd, :cost, :manyuses, :ipicture, :remote_ipicture_url
  mount_uploader :ipicture, IpictureUploader

  #Regex code to validate the presence of a correct item
  VALID_HP_REGEX = /\A[0-9]+\z/
  VALID_ATK_REGEX = /\A[0-9]+\z/
  VALID_DEF_REGEX = /\A[0-9]+\z/
  VALID_SPD_REGEX = /\A[0-9]+\z/
  VALID_COST_REGEX = /\A[0-9]+\z/
  VALID_ITEM_REGEX = /\A[A-Za-z0-9 ]+\z/
  VALID_DESCRIPTION_REGEX = /\A[ A-Za-z0-9!,.?]+\z/
  validates :name, presence: true, format: { with: VALID_ITEM_REGEX}, uniqueness: { case_sensitive: false}
  validates :description, presence: true, format: { with: VALID_DESCRIPTION_REGEX}
  validates :hp, presence: true, format: { with: VALID_HP_REGEX}
  validates :atk, presence: true, format: { with: VALID_ATK_REGEX}
  validates :def, presence: true, format: { with: VALID_DEF_REGEX}
  validates :spd, presence: true, format: { with: VALID_SPD_REGEX}
  validates :cost, presence: true, format: { with: VALID_COST_REGEX}

  def to_param # overridden
      name
  end
end
