class Treatment < ActiveRecord::Base
  belongs_to :healers
  attr_accessible :description, :name
end
