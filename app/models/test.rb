class Test < ActiveRecord::Base
  has_many :questions
  attr_accessible :description, :name, :result
end
