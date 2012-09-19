class Treatment < ActiveRecord::Base
  belongs_to :specialists
  attr_accessible :description, :name
end
