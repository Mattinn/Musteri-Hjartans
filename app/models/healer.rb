class Healer < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :treatments
  attr_accessible :name, :postal_code
end
