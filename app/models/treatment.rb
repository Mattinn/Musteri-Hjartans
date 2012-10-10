class Treatment < ActiveRecord::Base
  has_and_belongs_to_many :healers
  attr_accessible :description, :name
end
