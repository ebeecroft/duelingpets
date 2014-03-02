class Suggestion < ActiveRecord::Base
  attr_accessible :description, :name, :email

  #Regex code to validate the presence of a correct suggestion
  VALID_VNAME_REGEX = /\A[A-Za-z][A-Za-z][A-Za-z][A-Za-z0-9 ]+([-][A-Za-z0-9 ]+)?\z/
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_DESCRIPTION_REGEX = /\A[A-Za-z0-9!',.? ]+\z/
  validates :name, presence: true, format: { with: VALID_VNAME_REGEX}
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}
  validates :description, presence: true, format: { with: VALID_DESCRIPTION_REGEX}
end
