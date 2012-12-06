class Category < ActiveRecord::Base
  # Categories for treatments
  attr_accessible :name, :description
  has_many :treatments
  
  validates_presence_of :name, :description
end
