class Treatment < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :category
  attr_accessible :description, :name
end
