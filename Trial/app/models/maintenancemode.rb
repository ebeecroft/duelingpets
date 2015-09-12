class Maintenancemode < ActiveRecord::Base
  attr_accessible :created_on, :maintenance_on, :name
end
