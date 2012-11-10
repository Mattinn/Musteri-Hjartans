class Treatment < ActiveRecord::Base
  has_and_belongs_to_many :users
  belongs_to :category
  attr_accessible :description, :name, :category_id, :category
  
  validates_presence_of :category_id
  validates_presence_of :name
  validates_presence_of :description
end
