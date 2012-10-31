class Category < ActiveRecord::Base
  # Category for treatments
  attr_accessible :name
  has_many :treatments
end
