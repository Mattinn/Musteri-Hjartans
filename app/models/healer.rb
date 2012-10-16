class Healer < ActiveRecord::Base
  belongs_to :user
  has_many :treatments
  attr_accessible :name, :postal_code, :treatments, :user
end
