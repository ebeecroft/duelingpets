class Sbook < ActiveRecord::Base
  attr_accessible :created_on, :maintenance, :name, :series_open, :user_id
end
