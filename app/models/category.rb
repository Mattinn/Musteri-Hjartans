class Category < ActiveRecord::Base
  # Categories for treatments
  attr_accessible :name
  has_many :treatments
  
  validates_presence_of :name
end
