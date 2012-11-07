class Category < ActiveRecord::Base
  # Categories for treatments
  attr_accessible :name
  has_many :treatments
end
