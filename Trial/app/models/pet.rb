class Pet < ActiveRecord::Base
  attr_accessible :created_on, :description, :species_name
end
